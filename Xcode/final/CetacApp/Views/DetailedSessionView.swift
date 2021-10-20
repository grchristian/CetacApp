//
//  DetailedSessionView.swift
//  CetacApp
//
//  Created by Equipo 1 on 06/10/21.
//

import SwiftUI

struct DetailedSessionView: View {
    @State var isPresentedEnviarDetalles = false
    
    var id: Int = 0
    var tanatologo: Int = 0
    var sesion: Int = 0
    @State var data = SessionData()
    
    func getData() {
        let urlString = "http://cetac.hernandez.dev/getSession.php?id=\(id)"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(SessionData.self, from: data)
                        self.data = decodedData
                    } catch {
                        print("Error, algo salió mal")
                    }
                }
            }
        }.resume()
    }
    
    var body: some View {
        if (getId() == tanatologo || getRank() == 1 || getRank() == 2) {
        Form() {
            Section(header: Text("General")) {
                HStack {
                    Text("Fecha")
                    Spacer(minLength: 100)
                    Text("\(data.fecha)")
                }
            }
            
            Section(header: Text("Sesión")) {
                HStack {
                    Text("Motivo")
                    Spacer(minLength: 100)
                    Text(data.motivo)
                }
                HStack {
                    Text("Intervención")
                    Spacer(minLength: 100)
                    Text(data.intervencion)
                }
                HStack {
                    Text("Herramienta")
                    Spacer(minLength: 100)
                    Text(data.herramienta)
                }
            }
            
            Section(header: Text("Evaluación")) {
                Text(data.evaluacion)
            }
            
            Section(header: Text("Cuota de Recuperación")) {
                HStack {
                    Text("Monto")
                    Spacer(minLength: 100)
                    Text("$ \(String(format: "%.2f", data.cuota))")
                }
            }
            
            Section(header: Text("Enviar detalles")) {
                Button("Enviar detalles por correo electrónico") {
                    isPresentedEnviarDetalles.toggle()
                }
                .sheet(isPresented: $isPresentedEnviarDetalles) {
                    SendDetailsView(isPresented: $isPresentedEnviarDetalles, id: id, sesion: sesion)
                }
            }
        }.onAppear(perform: {
            self.getData()
        })
        .navigationTitle("Sesión \(sesion)")
        } else {
            Text("La sesión fue llevada a cabo por otro tanatólogo")
        }

        
    }
}

struct DetailedSessionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedSessionView()
    }
}
