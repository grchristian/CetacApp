//
//  UsuarioListView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 01/10/21.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var isPresentedNewUser = false
    
    @State var nombre = ""
    @State var fechaDeNacimiento = ""
    @State var equis = ""
    
    @State var searchText = ""
    @State var isSearching = false
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
                    ForEach((viewModel.items).filter({ "\($0)".localizedCaseInsensitiveContains(searchText) || searchText.isEmpty }), id: \.self) { item in
                        NavigationLink(
                            destination: DetailedUserView(id: item.id),
                            label: {
                                Text(item.nombre)
        
                            })
                            
                    }.onDelete(perform: deleteUser)
                }
                .listStyle(InsetListStyle())
                .navigationBarTitle("Usuarios")
                .navigationBarItems(trailing: plusButton)
            }
        }.sheet(isPresented: $isPresentedNewUser, content: {
            NewUserView(isPresented: $isPresentedNewUser)
        })
    }
    
    private func deleteUser(indexSet: IndexSet) {
        let id = indexSet.map { viewModel.items[$0].id }
        DispatchQueue.main.async {
            let parameters: [String: Any] = ["id": id[0]]
            self.viewModel.deleteUser(parameters: parameters)
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.viewModel.fetchUsers()
            }
        }
    }
    
    var plusButton: some View {
        Button(action: {
            isPresentedNewUser.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
