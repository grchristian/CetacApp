//
//  TanatologoListView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 06/10/21.
//

import SwiftUI
import Combine

struct TanatologoListView: View {
    @ObservedObject var networkController = NetworkController()
    @State private var search = ""
    @State var isPresentedNewTanatologo = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar usuarios", text: $search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.top, .leading, .trailing])
                    .padding(.bottom, 0)
                
                List {
                    NavigationLink(
                        destination: Text("Vista tanatólogo"),
                        label: {
                            Text("Martin Molina")
    
                        })
                    NavigationLink(
                        destination: Text("Vista tanatólogo"),
                        label: {
                            Text("Berenice Saucedo")
    
                        })
                }
            }.navigationTitle("Tanatólogos")
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
        .sheet(isPresented: $isPresentedNewTanatologo, content: {
            NewTanatologoView(isPresented: $isPresentedNewTanatologo)
        })
        
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
