//
//  SoporteAdminListView.swift
//  CetacApp
//
//  Created by Equipo 1 on 17/10/21.
//

import SwiftUI

struct SoporteAdminListView: View {
    @State private var search = ""
    @State var isPresentedNewSoporteAdmin = false
    
    // Búsqueda
    @State var searchText = ""
    @State var isSearching = false
    
    // Obtener datos
    @State var data = SoporteAdminListData()
    
    func getData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/adminSupport"
        let url = URL(string: urlString)
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(SoporteAdminListData.self, from: data)
                        self.data = decodedData
                    } catch {
                        print("Error, algo salió mal")
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        TextField("Buscar", text: $searchText)
                            .padding(.leading, 24)
                            .onTapGesture(perform: {
                                isSearching = true;
                            })
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
                    .padding(.horizontal)
                    .onTapGesture(perform: {
                        isSearching = true
                    })
                    .overlay (
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            
                            if isSearching {
                                Button(action: { searchText = "" }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .padding(.vertical)
                                })
                            }
                        }.padding(.horizontal, 32)
                        .foregroundColor(.gray)
                    ).transition(.move(edge: .trailing))
                    .animation(.spring())
                    
                    if isSearching {
                        Button(action: {
                            isSearching = false
                            searchText = ""
                            
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }, label: {
                            Text("Cancelar")
                                .padding(.trailing)
                                .padding(.leading, 0)
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                }
                
                List {
                    ForEach((data.data).filter({ "\($0)".localizedCaseInsensitiveContains(searchText) || searchText.isEmpty }), id: \.self) { item in
                        NavigationLink(
                            destination: DetailedSoporteAdminView(id: item.id),
                            label: {
                                Text(item.nombre)
                                if(!item.activated) {
                                    Text("Sin activar")
                                        .font(.caption)
                                        .foregroundColor(Color.red)
                                }
                            })
                            
                    }
                }
            }
            .onAppear(perform: {
                let parameters: [String: Any] = ["token": getToken()]
                self.getData(parameters: parameters)
            })
            .listStyle(InsetListStyle())
            .navigationTitle("Soporte Admin")
            .navigationBarItems(trailing: plusButton)
                
                /*if search.isEmpty {
                    List(networkController.users, id: \.login) { user in
                        Text(user.login)
                    }
                } else {
                    List(networkController.users.filter {
                        $0.login.contains(search.lowercased())
                    }, id: \.login) { user in
                        Text(user.login)
                    }
                }*/
        }
        .sheet(isPresented: $isPresentedNewSoporteAdmin, onDismiss: {
            let parameters: [String: Any] = ["token": getToken()]
            self.getData(parameters: parameters)
        }) {
            NewSoporteAdminView(isPresented: $isPresentedNewSoporteAdmin)
        }
        
    }
    
    var plusButton: some View {
        Button(action: {
            isPresentedNewSoporteAdmin.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct SoporteAdminListView_Previews: PreviewProvider {
    static var previews: some View {
        SoporteAdminListView()
    }
}
