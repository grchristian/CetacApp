//
//  SendDetailsView.swift
//  CetacApp
//
//  Created by Equipo 1 on 14/10/21.
//

import SwiftUI

struct SendDetailsView: View {
    @Binding var isPresented: Bool
    
    @State var id: Int = 0
    @State var sesion: Int = 0
    
    @State var email: String = ""
    
    @State var isAlert = false
    
    // Post Data
    func postData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/sendSessionEmail.php"
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
                    TextField("Correo", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                .alert(isPresented: $isAlert, content: {
                    let title = Text("Error")
                    let message = Text("Por favor, llena todos los campos")
                    return Alert(title: title, message: message)
                })
            }
            .navigationBarTitle("Enviar Detalles", displayMode: .inline)
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
            if email != "" {
                let parameters: [String: Any] = ["email": email, "id": id, "sesion": sesion]
                postData(parameters: parameters)
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }, label: {
            Text("Enviar")
        })
    }
}

/*struct SendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SendDetailsView()
    }
}*/
