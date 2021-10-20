//
//  NewSoporteAdminView.swift
//  CetacApp
//
//  Created by Equipo 1 on 18/10/21.
//

import SwiftUI

struct NewSoporteAdminView: View {
    @Binding var isPresented: Bool
    @State var nombre: String = ""
    @State var correo: String = ""
    
    @State var isAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    // Post Data
    func postData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/createAdminSupport"
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
                        print("Error, algo salió mal")
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información")) {
                    TextField("Nombre", text: $nombre)
                    TextField("Correo", text: $correo)
                        .keyboardType(.emailAddress)
                }
                
                Text("Se enviará vía correo electrónico un enlace para crear la contraseña de la cuenta.")
                
                .alert(isPresented: $isAlert, content: {
                    return Alert(title: Text(alertTitle), message: Text(alertMessage))
                })
            }
            .navigationBarTitle("Nuevo Soporte Admin", displayMode: .inline)
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
            if !LoginView().isValidEmail(correo) {
                alertTitle = "Error"
                alertMessage = "Ingresa un correo válido"
                isAlert.toggle()
                return
            }
            if nombre != "" && correo != "" {
                let parameters: [String: Any] = ["nombre": nombre, "correo": correo, "token": getToken()]
                postData(parameters: parameters)
                isPresented.toggle()
            } else {
                alertTitle = "Error"
                alertMessage = "Por favor, llena todos los campos"
                isAlert.toggle()
            }
        }, label: {
            Text("Agregar")
        })
    }
}
/*
struct NewSoporteAdminView_Previews: PreviewProvider {
    static var previews: some View {
        NewTanatologoView()
    }
}
*/
