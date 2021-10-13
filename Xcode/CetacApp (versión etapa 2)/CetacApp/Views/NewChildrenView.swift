//
//  NewChildrenView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 08/10/21.
//

import SwiftUI

struct NewChildrenView: View {
    @Binding var isPresented: Bool
    var parent: Int
    
    @State var data = UserData()
    
    // Campos
    @State var nombre: String = ""
    @State private var fechaDeNacimiento: Date = Date()
    @State private var sexo = "Masculino"
    let sexos = ["Masculino", "Femenino", "Otro"]
    
    // Alerta
    @State var isAlert = false
    
    // Date Formatter
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
    
    // Post Data
    func postData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/createChildren.php"
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
                Section(header: Text("Información general")) {
                    TextField("Nombre", text: $nombre)
                    DatePicker("Fecha de Nacimiento", selection: $fechaDeNacimiento, in: ...Date(), displayedComponents: .date)
                    Picker("Sexo", selection: $sexo) {
                        ForEach(sexos, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                .alert(isPresented: $isAlert, content: {
                    let title = Text("Error")
                    let message = Text("Por favor, llena todos los campos")
                    return Alert(title: title, message: message)
                })
            }
            .navigationBarTitle("Agregar hijo", displayMode: .inline)
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
            if nombre != "" {
                let parameters: [String: Any] = ["nombre": nombre, "sexo": sexo, "fechaDeNacimiento": dateFormatter.string(from: fechaDeNacimiento), "parent": parent]
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
struct NewChildrenView_Previews: PreviewProvider {
    static var previews: some View {
        NewChildrenView()
    }
}
*/
