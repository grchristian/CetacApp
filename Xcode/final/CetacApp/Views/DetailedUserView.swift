//
//  DetailedUserView.swift
//  CetacApp
//
//  Created by Equipo 1 on 01/10/21.
//

import SwiftUI

struct DetailedUserView: View {
    @State var isPresentedNuevaSesion = false
    @State var isPresentedNewChildren = false
    
    // Alertas
    @State private var isAlert = false
    
    var id: Int = 0
    
    @State var data = UserData()
    
    func getData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/getUser"
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
                        let decodedData = try decoder.decode(UserData.self, from: data)
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
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Edad")
                        Spacer(minLength: 100)
                        Text(String(data.edad))
                    }
                    HStack {
                        Text("Sexo")
                        Spacer(minLength: 100)
                        Text(data.sexo == "M" ? "Masculino" : (data.sexo == "F" ? "Femenino" : "Otro"))
                    }
                    HStack {
                        Text("Ocupación")
                        Spacer(minLength: 100)
                        Text(data.ocupacion)
                    }
                    HStack {
                        Text("Religión")
                        Spacer(minLength: 100)
                        Text(data.religion)
                    }
                    HStack {
                        Text("Procedencia")
                        Spacer(minLength: 100)
                        Text(data.procedencia)
                    }
                }
                
                List {
                    Section(header: Text("Hijos")) {
                        
                        ForEach(data.hijos, id: \.self) { item in
                            VStack(alignment: .leading) {
                                Text(item.nombre)
                                Text(String(item.edad == 1 ? "\(item.edad) año" : "\(item.edad) años")).font(.caption).foregroundColor(.gray)
                                Text(item.sexo == "M" ? "Masculino" : (item.sexo == "F" ? "Femenino" : "Otro")).font(.caption2).foregroundColor(.gray)
                            }
                        }
                        
                        Button("Agregar hijo") {
                            if(getRank() == 3) {
                                self.isPresentedNewChildren.toggle()
                            } else {
                                isAlert.toggle()
                            }
                        }.sheet(isPresented: $isPresentedNewChildren, onDismiss: {
                            let parameters: [String: Any] = ["id": id, "token": getToken()]
                            self.getData(parameters: parameters)
                        }) {
                            NewChildrenView(isPresented: self.$isPresentedNewChildren, parent: id)
                        }
                    }
                    
                }
                
                Section(header: Text("Información de contacto")) {
                    VStack(alignment: .leading) {
                        Text(data.calle + " " + data.interior)
                        Text(data.colonia)
                        Text(data.alcaldia + " " + data.cp)
                    }
                    HStack {
                        Text("Teléfono")
                        Spacer(minLength: 100)
                        Text(data.telefono)
                    }
                    HStack {
                        Text("Móvil")
                        Spacer(minLength: 100)
                        Text(data.movil)
                    }
                }
                
                Section(header: Text("Motivo de la consulta")) {
                    HStack() {
                        Text(data.motivo)
                    }
                }
                
                Section(header: Text("Identificación de la respuesta actitudinal")) {
                    HStack() {
                        Text(data.identificacionRespuesta)
                    }
                }
                
                Section(header: Text("E.K.R.")) {
                    HStack() {
                        Text(data.ekr)
                    }
                }
            
                List {
                    Section(header: Text("Sesiones")) {
                        ForEach(data.sesiones, id: \.self) { item in
                            NavigationLink(
                                destination: DetailedSessionView(id: item.id, tanatologo: item.tanatologo, sesion: item.sesion),
                                label: {
                                    VStack(alignment: .leading) {
                                        Text("Sesión " + String(item.sesion))
                                        Text(item.fecha).font(.caption).foregroundColor(.gray)
                                        Text(item.nombreTanatologo).font(.caption2).foregroundColor(.gray)
                                    }
                            })
                        }
                        Button("Agregar nueva sesión") {
                            if(getRank() == 3) {
                                isPresentedNuevaSesion.toggle()
                            } else {
                                isAlert.toggle()
                            }
                        }
                    }
                    
                }
            }
            .onAppear(perform: {
                let parameters: [String: Any] = ["id": id, "token": getToken()]
                self.getData(parameters: parameters)
            })

        }
        .navigationTitle("Usuario")
        .navigationBarItems(trailing: plusButton)
        .sheet(isPresented: $isPresentedNuevaSesion, onDismiss: {
            let parameters: [String: Any] = ["id": id, "token": getToken()]
            self.getData(parameters: parameters)
        }) {
            NewSessionView(isPresented: $isPresentedNuevaSesion, id: id, totalSesiones: data.totalSesiones)
        }
        .alert(isPresented: $isAlert, content: {
            let title = Text("Error")
            let message = Text("No tienes acceso a esta función")
            return Alert(title: title, message: message)
        })
    }
    
    var plusButton: some View {
        Button(action: {
            if(getRank() == 3) {
                isPresentedNuevaSesion.toggle()
            } else {
                isAlert.toggle()
            }
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct DetailedUserView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedUserView()
    }
}
