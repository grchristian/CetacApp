//
//  NewTanatologoView.swift
//  CetacApp
//
//  Created by Equipo 1 on 07/10/21.
//

import SwiftUI

struct NewTanatologoView: View {
    @Binding var isPresented: Bool
    @State var nombre: String = ""
    @State var correo: String = ""
    @State var experiencia: String = ""
    @State var isAlert = false
    
    // Post Data
    func postData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/createThanatologist"
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
                
                Section(header: Text("Experiencia")) {
                    TextEditor(text: $experiencia)
                }
                
                Text("Se enviará vía correo electrónico un enlace para crear la contraseña de la cuenta.")
                
                .alert(isPresented: $isAlert, content: {
                    let title = Text("Error")
                    let message = Text("Por favor, llena todos los campos")
                    return Alert(title: title, message: message)
                })
            }
            .navigationBarTitle("Nuevo Tanatólogo", displayMode: .inline)
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
            if nombre != "" && correo != "" {
                let parameters: [String: Any] = ["nombre": nombre, "correo": correo, "experiencia": experiencia, "token": getToken()]
                postData(parameters: parameters)
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }, label: {
            Text("Agregar")
        })
    }
}
/*
struct NewTanatologoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTanatologoView()
    }
}
*/
