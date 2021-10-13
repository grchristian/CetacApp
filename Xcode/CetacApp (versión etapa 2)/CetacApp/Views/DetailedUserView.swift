//
//  DetailedUserView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 01/10/21.
//

import SwiftUI

struct DetailedUserView: View {
    @State var isPresentedNuevaSesion = false
    @State var isPresentedNewChildren = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var id: Int = 0
    
    @State var data = UserData()
    
    func getData() {
        let urlString = "https://cetac.hernandez.dev/getUser.php?id=\(id)"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(UserData.self, from: data)
                        self.data = decodedData
                    } catch {
                        print("Error, algo salió mal")
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
                            self.isPresentedNewChildren.toggle()
                        }.sheet(isPresented: $isPresentedNewChildren, onDismiss: {
                            self.getData()
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
                                destination: DetailedSessionView(id: item.id, sesion: item.sesion),
                                label: {
                                    VStack(alignment: .leading) {
                                        Text("Sesión " + String(item.sesion))
                                        Text(item.fecha).font(.caption).foregroundColor(.gray)
                                        Text(item.nombreTanatologo).font(.caption2).foregroundColor(.gray)
                                    }
                            })
                        }
                        Button("Agregar nueva sesión") {
                            isPresentedNuevaSesion.toggle()
                        }
                    }
                    
                }
            }
            .onAppear(perform: {
                self.getData()
            })

        }
        .navigationTitle("Usuario")
        .navigationBarItems(trailing: plusButton)
        .sheet(isPresented: $isPresentedNuevaSesion, onDismiss: {
            self.getData()
        }) {
            NewSessionView(isPresented: $isPresentedNuevaSesion, id: id, totalSesiones: data.totalSesiones)
        }
    }
    
    var plusButton: some View {
        Button(action: {
            isPresentedNuevaSesion.toggle()
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
