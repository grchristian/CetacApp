//
//  NewSessionView.swift
//  CetacApp
//
//  Created by Equipo 1 on 07/10/21.
//

import SwiftUI

struct NewSessionView: View {
    @Binding var isPresented: Bool
    
    var id: Int = 0
    var totalSesiones: Int = 0
    
    // Campos
    @State private var fecha: Date = Date()
    
    @State var evaluacion: String = ""
    @State var cuota: String = ""
    
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
        let urlString = "https://cetac.hernandez.dev/createSession"
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
    
    // Selectors
    @State private var selectedMotivo = "Abuso"
    let motivos = [
        "Abuso",
        "Adicción",
        "Ansiedad",
        "Baja autoestima",
        "Codependencia",
        "Comunicación Familiar",
        "Conflicto con hermano",
        "Conflicto con madre",
        "Conflicto con padre",
        "Dependencia",
        "Divorcio",
        "Duelo",
        "Duelo Grupal",
        "Enfermedad",
        "Enfermedad crónico degenerativa",
        "Heridas de la infancia",
        "Identidad de género",
        "Infertilidad",
        "Infidelidad",
        "Intento de suicidio",
        "Miedo",
        "Pérdida de bienes materiales",
        "Pérdida de identidad",
        "Pérdida laboral",
        "Relación con los padres",
        "Ruptura de Noviazgo",
        "Stress",
        "Trastorno Obsesivo",
        "Violación",
        "Violencia intrafamiliar",
        "Violencia Psicológica",
        "Viudez",
        "Otro"
      ]
    
    @State private var selectedIntervencion = "Tanatología"
    let intervenciones = [
        "Tanatología",
        "Acompañamiento Individual",
        "Acompañamiento Grupal",
        "Logoterapia",
        "Mindfulness",
        "Aromaterapia y Musicoterapia",
        "Cristaloterapia",
        "Reiki",
        "Biomagnetismo",
        "Angeloterapia",
        "Cama Térmica De Jade",
        "Flores De Bach",
        "Brisas Ambientales"
      ]
    
    @State private var selectedHerramienta = "Contención"
    let herramientas = [
        "Contención",
        "Diálogo",
        "Ejercicio",
        "Encuadre",
        "Infografía",
        "Dinámica",
        "Lectura",
        "Meditación",
        "Video",
        "Otro"
      ]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    HStack {
                        Text("Sesión")
                        Spacer(minLength: 100)
                        Text("\(totalSesiones+1)")
                    }
                    DatePicker("Fecha", selection: $fecha, in: ...Date(), displayedComponents: .date)
                }
                
                Section(header: Text("Consulta")) {
                    Picker("Motivo", selection: $selectedMotivo) {
                        ForEach(motivos, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Tipo de Intervención", selection: $selectedIntervencion) {
                        ForEach(intervenciones, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Herramienta", selection: $selectedHerramienta) {
                        ForEach(herramientas, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Evaluación")) {
                    TextEditor(text: $evaluacion)
                }
                
                Section(header: Text("Cuota de Recuperación")) {
                    TextField("Monto", text: $cuota)
                        .keyboardType(.decimalPad)
                }
                
                .alert(isPresented: $isAlert, content: {
                    let title = Text("Error")
                    let message = Text("Por favor, llena todos los campos")
                    return Alert(title: title, message: message)
                })
            }
            .navigationBarTitle("Nueva Sesión", displayMode: .inline)
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
            if evaluacion != "" && cuota != "" {
                let parameters: [String: Any] = ["usuario": id, "tanatologo": getId(), "fecha": dateFormatter.string(from: fecha), "motivo": selectedMotivo, "intervencion": selectedIntervencion, "herramienta": selectedHerramienta, "evaluacion": evaluacion, "cuota": cuota, "token": getToken()]
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
struct NewSessionView_Previews: PreviewProvider {
    static var previews: some View {
        NewSessionView(isPresented: false, name: "", age: "", equis: "")
    }
}
*/
