//
//  AlternativasView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 06/10/21.
//

import SwiftUI

struct AlternativasView: View {
    @State var showInfoModalView: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                NavigationLink(destination: InformacionView(titulo: "Flores de Bach", texto: "Ayuda a reestablecer el equilibrio emocional y energético mediante extractos naturales extraídos de flores silvestres con el fin de relajar y aliviar la mente en situaciones de duelo, ansiedad, miedos, stress, entre otros. No tienen efectos secundarios y sin problema se pueden utilizar mientras consumes otros medicamentos. Contamos con 38 soluciones naturales.")) {
                    ZStack {
                        Image("floresdebach")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                        Text("Flores de Bach")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Brisas Ambientales", texto: "Aromatizantes ambientales con propiedades de aromaterapia que, a través del olfato, estimula el sistema nervioso central ofreciendo resultados positivos en el manejo de las emociones. Se cuenta con brisas relajantes, brisas reanimantes y brisas equilibrantes.")) {
                    ZStack {
                        Image("brisasambientales")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Flores de Bach")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .navigationTitle("Herramientas Alternativas")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button() {
                print("Cuenta")
                showInfoModalView = true
            } label: {
                Label("Cuenta", systemImage: "person.circle")
            }
        }
        .sheet(isPresented: $showInfoModalView) {
            IniciarSesionView()
        }
    }
}

struct AlternativasView_Previews: PreviewProvider {
    static var previews: some View {
        AlternativasView()
    }
}
