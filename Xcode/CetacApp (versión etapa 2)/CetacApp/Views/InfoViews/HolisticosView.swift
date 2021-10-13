//
//  HolisticosView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 06/10/21.
//

import SwiftUI

struct HolisticosView: View {
    @State var showInfoModalView: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                NavigationLink(destination: InformacionView(titulo: "Aromaterapia", texto: "En un espacio y ambiente de tranquilidad la persona vive un estado de bienestar físico, emocional y mental mediante el uso controlado de los aromas de nuestras esencias combinado con musicoterapia transportando al individuo a un ambiente de armonía y sensación de calma y relajación con el fin de ayudar a equilibrar cambios de estado de ánimo y de energía corporal.")) {
                    ZStack {
                        Image("aromaterapia")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                        Text("Aromaterapia")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Cristaloterapia", texto: "Es una terapia energética que equilibra el cuerpo desde la parte física, emocional y espiritual. Se trabaja en el conjunto de chakras ubicado a lo largo de la columna vertebral hasta el cerebro. Esta energía circula a través de la persona y representa el conjunto de experiencias de distintos niveles y se almacena a lo largo de su vida y en ocasiones se encuentra bloqueada. Ayudamos a que esa energía fluya en el individuo para restablecer la armonía y conexión con su mente, sus emociones, su cuerpo y su espíritu.")) {
                    ZStack {
                        Image("cristaloterapia")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Cristaloterapia")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Reiki", texto: "Es un método de canalización y transmisión de energía vital para que la persona obtenga paz y equilibrio físico, mental, emocional y espiritual.")) {
                    ZStack {
                        Image("reiki")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Reiki")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Biomagnetismo", texto: "...")) {
                    ZStack {
                        Image("biomagnetismo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Biomagnetismo")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Angeloterapia", texto: "Es una herramienta que te ayuda a trabajar tu autoestima, a darte cuenta de todo tu potencial; te ayuda a ver lo maravilloso y perfecto ser humano que eres y que no hay obstáculos que no puedas superar enfocándonos en una visión siempre positiva y optimista.")) {
                    ZStack {
                        Image("angeloterapia")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Angeloterapia")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Musicoterapia", texto: "...")) {
                    ZStack {
                        Image("musicoterapia")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Musicoterapia")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Cama Térmica de Jade", texto: "Cama Térmica de Jade\n\nEl calor que expide la cama térmica con regulación de temperatura y la musicoterapia en conjunto, la persona es transportada a un ambiente de armonía y sensación de calma y relajación de los diferentes músculos de cuerpo con el fin de ayudar a equilibrar cambios de estado de ánimo y de energía corporal.")) {
                    ZStack {
                        Image("camatermica")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Cama Térmica de Jade")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .navigationTitle("Servicios Holísticos")
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

struct HolisticosView_Previews: PreviewProvider {
    static var previews: some View {
        HolisticosView()
    }
}
