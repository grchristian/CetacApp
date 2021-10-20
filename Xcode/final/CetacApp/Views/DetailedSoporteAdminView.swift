//
//  DetailedTanatologoView.swift
//  CetacApp
//
//  Created by Equipo 1 on 14/10/21.
//

import SwiftUI

struct DetailedSoporteAdminView: View {
    @State var isPresentedChangePassword = false
    
    var id: Int = 0
    
    @State var data = SoporteAdminData()
    
    func getData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/getAdminSupport"
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
                        let decodedData = try decoder.decode(SoporteAdminData.self, from: data)
                        self.data = decodedData
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Información general")) {
                    HStack {
                        Text("Nombre")
                        Spacer(minLength: 100)
                        Text(data.nombre)
                    }
                    HStack {
                        Text("Correo")
                        Spacer(minLength: 100)
                        Text(data.email)
                    }
                }
                
                Button("Cambiar contraseña") {
                    isPresentedChangePassword.toggle()
                }
                .sheet(isPresented: $isPresentedChangePassword) {
                    ChangePasswordView(isPresented: $isPresentedChangePassword, id: id)
                }
            }
            .onAppear(perform: {
                let parameters: [String: Any] = ["id": id, "token": getToken()]
                self.getData(parameters: parameters)
            })

        }
        .navigationTitle("Soporte Admin")
    }
}

struct DetailedSoporteAdminView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedSoporteAdminView()
    }
}
