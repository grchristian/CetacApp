//
//  TanatologoListView.swift
//  CetacApp
//
//  Created by Equipo 1 on 06/10/21.
//

import SwiftUI
import Combine

struct TanatologoListView: View {
    @State private var search = ""
    @State var isPresentedNewTanatologo = false
    
    // Búsqueda
    @State var searchText = ""
    @State var isSearching = false
    
    @State var data = TanatologoListData()
    
    func getData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/thanatologist"
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
                        let decodedData = try decoder.decode(TanatologoListData.self, from: data)
                        self.data = decodedData
                    } catch {
                        print(error)
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
                            destination: DetailedTanatologoView(id: item.id),
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
            .navigationTitle("Tanatólogos")
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
        .sheet(isPresented: $isPresentedNewTanatologo, onDismiss: {
            let parameters: [String: Any] = ["token": getToken()]
            self.getData(parameters: parameters)
        }) {
            NewTanatologoView(isPresented: $isPresentedNewTanatologo)
        }
        
    }
    
    var plusButton: some View {
        Button(action: {
            isPresentedNewTanatologo.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct TanatologoListView_Previews: PreviewProvider {
    static var previews: some View {
        TanatologoListView()
    }
}

// MARK: - Networking
//Saca los usuarios de github/users en JSON
/*
class NetworkController: ObservableObject {
    private var cancellable: AnyCancellable?
    
    let url = URL(string: "https://api.github.com/users")!
    @Published var users = [User(login: "", repos_url: "")]
    
    init() {
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .receive(on: DispatchQueue.main)
            .decode(type: [User].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .sink(receiveValue: { users in
                self.users = users
            })
    }
}

struct User: Decodable {
    var login: String
    var repos_url: String
}
*/
