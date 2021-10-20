//
//  ReportesView.swift
//  CetacApp
//
//  Created by Equipo 1 on 17/10/21.
//

import SwiftUI
//import SwiftUICharts

struct ReportesView: View {
    @State private var desde = Date()
    @State private var hasta = Date()
    
    // Date Formatter
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
    
    
    @State var data = ReporteData()
    
    func getData(parameters: [String: Any]) {
        let urlString = "https://cetac.hernandez.dev/reporte.php"
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
                        let decodedData = try decoder.decode(ReporteData.self, from: data)
                        self.data = decodedData
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
    
    func chartValues(data: [ReporteItemData]) -> (values: [Double], labels: [String]) {
        var Bvalues: [Double] = []
        var Blabels: [String] = []
        for item in data {
            if(item.value != 0) {
                Bvalues.append(Double(item.value))
                Blabels.append(item.item)
            }
        }
        return (values: Bvalues, labels: Blabels)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Rango de Fechas")) {
                    DatePicker(selection: $desde, in: ...Date(), displayedComponents: .date) {
                        Text("Desde")
                    }
                    DatePicker(selection: $hasta, in: ...Date(), displayedComponents: .date) {
                        Text("Hasta")
                    }
                    Button(action: {
                        let parameters: [String: Any] = ["desde": dateFormatter.string(from: desde), "hasta": dateFormatter.string(from: hasta), "token": getToken()]
                        getData(parameters: parameters)
                    }, label: {
                        Text("Generar reporte")
                    })
                }
                
                Section(header: Text("Usuarios atendidos por sexo")) {
                    if(data.usuariosPorSexo.count > 0) {
                        ForEach(data.usuariosPorSexo, id: \.self) { item in
                            HStack {
                                Text(item.item)
                                Spacer(minLength: 100)
                                Text(String(Int(item.value)))
                            }
                        }
                        
                        let chartValues = chartValues(data: data.usuariosPorSexo)
                        
                        NavigationLink(destination: ChartView(values: chartValues.values, labels: chartValues.labels, title: "Usuarios atendidos por sexo")) {
                            Button(action: {
                                print("Ver gráfica")
                            }, label: {
                                Text("Ver gráfica")
                            })
                        }
                    } else {
                        Text("No hay datos")
                    }
                }
                
                Section(header: Text("Usuarios atendidos por tanatólogo")) {
                    if(data.usuariosPorTanatologo.count > 0) {
                        ForEach(data.usuariosPorTanatologo, id: \.self) { item in
                            HStack {
                                Text(item.item)
                                Spacer(minLength: 100)
                                Text(String(Int(item.value)))
                            }
                        }
                        
                        let chartValues = chartValues(data: data.usuariosPorTanatologo)
                        
                        NavigationLink(destination: ChartView(values: chartValues.values, labels: chartValues.labels, title: "Usuarios atendidos por tanatólogo")) {
                            Button(action: {
                                print("Ver gráfica")
                            }, label: {
                                Text("Ver gráfica")
                            })
                        }
                    } else {
                        Text("No hay datos")
                    }
                }
                
                Section(header: Text("Cuota de recuperación por tanatólogo")) {
                    if(data.cuotaPorTanatologo.count > 0) {
                        ForEach(data.cuotaPorTanatologo, id: \.self) { item in
                            HStack {
                                Text(item.item)
                                Spacer(minLength: 100)
                                Text("$\(String(format: "%.2f", item.value))")
                            }
                        }
                        
                        let chartValues = chartValues(data: data.cuotaPorTanatologo)
                        
                        NavigationLink(destination: ChartView(values: chartValues.values, labels: chartValues.labels, format: "$%.2f", title: "Cuota de recuperación por tanatólogo")) {
                            Button(action: {
                                print("Ver gráfica")
                            }, label: {
                                Text("Ver gráfica")
                            })
                        }
                    } else {
                        Text("No hay datos")
                    }
                }
                
                Section(header: Text("Cuota de recuperación")) {
                    if(data.cuotaTotal != 0) {
                        HStack {
                            Text("Total")
                            Spacer(minLength: 100)
                            Text("$\(String(format: "%.2f", data.cuotaTotal))")
                        }
                    } else {
                        Text("No hay datos")
                    }
                }
                
                Section(header: Text("Número de motivos de intervención atendidos")) {
                    if(data.motivoDeIntervencion.count > 0) {
                        ForEach(data.motivoDeIntervencion, id: \.self) { item in
                            HStack {
                                Text(item.item)
                                Spacer(minLength: 100)
                                Text(String(Int(item.value)))
                            }
                        }
                        
                        let chartValues = chartValues(data: data.motivoDeIntervencion)
                        
                        NavigationLink(destination: ChartView(values: chartValues.values, labels: chartValues.labels, title: "Número de motivos de intervención atendidos")) {
                            Button(action: {
                                print("Ver gráfica")
                            }, label: {
                                Text("Ver gráfica")
                            })
                        }
                    } else {
                        Text("No hay datos")
                    }
                }
                
                Section(header: Text("Número de tipo de intervención utilizada")) {
                    if(data.tipoDeIntervencion.count > 0) {
                        ForEach(data.tipoDeIntervencion, id: \.self) { item in
                            HStack {
                                Text(item.item)
                                Spacer(minLength: 100)
                                Text(String(Int(item.value)))
                            }
                        }
                        
                        let chartValues = chartValues(data: data.tipoDeIntervencion)
                        
                        NavigationLink(destination: ChartView(values: chartValues.values, labels: chartValues.labels, title: "Número de tipo de intervención utilizada")) {
                            Button(action: {
                                print("Ver gráfica")
                            }, label: {
                                Text("Ver gráfica")
                            })
                        }
                    } else {
                        Text("No hay datos")
                    }
                }
                
                Section(header: Text("Número de herramientas de intervención utilizadas")) {
                    if(data.herramientas.count > 0) {
                        ForEach(data.herramientas, id: \.self) { item in
                            HStack {
                                Text(item.item)
                                Spacer(minLength: 100)
                                Text(String(Int(item.value)))
                            }
                        }
                        
                        let chartValues = chartValues(data: data.herramientas)
                        
                        NavigationLink(destination: ChartView(values: chartValues.values, labels: chartValues.labels, title: "Número de herramientas de intervención utilizadas")) {
                            Button(action: {
                                print("Ver gráfica")
                            }, label: {
                                Text("Ver gráfica")
                            })
                        }
                    } else {
                        Text("No hay datos")
                    }
                }
                
            }
            .navigationBarTitle("Reportes")
            .onAppear {
                let parameters: [String: Any] = ["desde": dateFormatter.string(from: desde), "hasta": dateFormatter.string(from: hasta), "token": getToken()]
                getData(parameters: parameters)
            }
        }
    }
}

struct ReportesView_Previews: PreviewProvider {
    static var previews: some View {
        ReportesView()
    }
}
