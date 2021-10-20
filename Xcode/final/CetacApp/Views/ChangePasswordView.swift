//
//  ChangePasswordView.swift
//  CetacApp
//
//  Created by Equipo 1 on 17/10/21.
//

import SwiftUI

struct ChangePasswordView: View {
    @Binding var isPresented: Bool
     
    var id: Int = 0
    @State var password1: String = ""
    @State var password2: String = ""
    
    // Alerta
    @State var isAlert = false
    
    // Post Data
    func postData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/changePassword.php"
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
                        /*let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(UserData.self, from: data)
                        self.data = decodedData*/
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Cambiar contraseña")) {
                    SecureField("Contraseña", text: $password1)
                    SecureField("Confirmar contraseña", text: $password2)
                }
                
                .alert(isPresented: $isAlert, content: {
                    let title = Text("Error")
                    let message = Text("Por favor, revisa las contraseñas")
                    return Alert(title: title, message: message)
                })
            }
            .navigationBarTitle("Cambiar contraseña", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
        }
    }
    
    var leading: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Cancelar")
        })
    }
    
    var trailing: some View {
        Button(action: {
            if password1 != "" && password2 != "" && password1 == password2 {
                let parameters: [String: Any] = ["id": id, "password": password1]
                postData(parameters: parameters)
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }, label: {
            Text("Cambiar")
        })
    }
}

/*struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}*/
