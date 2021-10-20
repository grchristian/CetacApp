//
//  NewUsuarioView.swift
//  CetacApp
//
//  Created by Equipo 1 on 01/10/21.
//

import SwiftUI

struct NewUserView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var isPresented: Bool
    
    @State var nombre: String = ""
    @State private var fechaDeNacimiento: Date = Date()
    
    @State private var sexo = "Masculino"
    let sexos = ["Masculino", "Femenino", "Otro"]
    
    @State var ocupacion: String = ""
    @State var religion: String = ""
    @State var procedencia: String = ""
    
    @State var calle: String = ""
    @State var interior: String = ""
    @State var colonia: String = ""
    @State var alcaldia: String = ""
    @State var cp: String = ""
    @State var telefono: String = ""
    @State var movil: String = ""
    
    @State var motivo: String = ""
    @State var identificacionRespuesta: String = ""
    @State var ekr: String = ""
    
    
    
        var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .none
            return formatter
        }
    
    
    @State var isAlert = false
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
                    TextField("Ocupación", text: $ocupacion)
                    TextField("Religión", text: $religion)
                    TextField("Procedencia", text: $procedencia)
                }
                
                Section(header: Text("Información de contacto")) {
                    TextField("Calle y número", text: $calle)
                    TextField("Interior", text: $interior)
                    TextField("Colonia", text: $colonia)
                    TextField("Alcaldia", text: $alcaldia)
                    TextField("Código Postal", text: $cp)
                        .keyboardType(.numberPad)
                    TextField("Teléfono", text: $telefono)
                        .keyboardType(.numberPad)
                    TextField("Móvil", text: $movil)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Motivo de la consulta")) {
                    TextEditor(text: $motivo)
                }
                
                Section(header: Text("Encuadre")) {
                    TextField("Identificación de la respuesta actitudinal", text: $identificacionRespuesta)
                    TextField("E.K.R.", text: $ekr)
                }
                
                .alert(isPresented: $isAlert, content: {
                    let title = Text("Error")
                    let message = Text("Por favor, llena todos los campos")
                    return Alert(title: title, message: message)
                })
            }
            .navigationBarTitle("Nuevo Usuario", displayMode: .inline)
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
            if nombre != "" && ocupacion != "" && religion != "" && procedencia != "" && calle != "" && colonia != "" && alcaldia != "" && cp != "" && telefono != "" && movil != "" && motivo != "" && identificacionRespuesta != "" && ekr != "" {
                let parameters: [String: Any] = ["nombre": nombre, "fechaDeNacimiento": dateFormatter.string(from: fechaDeNacimiento), "sexo": sexo, "ocupacion": ocupacion, "religion": religion, "procedencia": procedencia, "calle": calle, "interior": interior, "colonia": colonia, "alcaldia": alcaldia, "cp": cp, "telefono": telefono, "movil": movil, "motivo": motivo, "identificacionRespuesta": identificacionRespuesta, "ekr": ekr, "token": getToken()]
                viewModel.createUser(parameters: parameters)
                let seconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    let parameters: [String: Any] = ["token": getToken()]
                    viewModel.fetchUsers(parameters: parameters)
                }
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }, label: {
            Text("Agregar")
        })
    }
}

/*struct NewUsuarioView_Previews: PreviewProvider {
    static var previews: some View {
        NewUsuarioView()
    }
}*/
