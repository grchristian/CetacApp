//
//  AcompanamientoView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 06/10/21.
//

import SwiftUI

struct AcompanamientoView: View {
    @State var showInfoModalView: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                NavigationLink(destination: InformacionView(titulo: "Tanatología", texto: "Es un proceso de encuentro personal en donde a través de un diálogo con la ayuda de técnicas y herramientas tanatológicas la persona expresa su situación de intervención con el fin de identificar y reconocer sus emociones ante una pérdida.")) {
                    ZStack {
                        Image("tanatologia")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                        Text("Tanatología")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Acompañamiento Individual", texto: "Proceso individual en donde se crea un vínculo de afecto y confianza, la persona se siente escuchada, comprendida, respetada y aceptada. Se busca resignificar su propia vida de alguna situación que está viviendo o vivió (miedos, violencia, dudas, inseguridades, bloqueos, vicios, etc.) con el fin de ayudarlos a desarrollar soluciones en su propio beneficio y vivir el aquí y el ahora.")) {
                    ZStack {
                        Image("acompanamientoindividual")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Acompañamiento Individual")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Acompañamiento Grupal", texto: "Proceso en donde las personas no se enjuician, se comparten las experiencias que al mismo tiempo está siendo vivida por el resto de los participantes. Se crean lazos de confianza, compasión, empatía y aceptación en un espacio seguro en donde se es libre de comunicar y dar solución ante una situación.")) {
                    ZStack {
                        Image("acompanamientogrupal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Acompañamiento Grupal")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Logoterapia", texto: "Proceso para guiar a la persona en su búsqueda del sentido de vida y permite descubrir la capacidad que tienen los humanos para superar los condicionamientos más difíciles “sanar a través del sentido”. Sanar, cuidar, acompañar lo que implica buscar sentido y esencia para vivir en plenitud.")) {
                    ZStack {
                        Image("logoterapia")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Logoterapia")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Mindfulness", texto: "Es una práctica que ayuda a la persona a enfocarse en el presente reconociendo que puede pasar por momentos de estrés, momentos de crisis laboral y personal, de baja autoestima y depresión. A través de herramientas de autoconocimiento, autoreconocimiento y autocontrol podemos entrenar la mente para tener una actitud de apertura, aceptación y solución en cualquier situación de nuestra vida para un balance y dominio emocional.")) {
                    ZStack {
                        Image("mindfulness")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Mindfulness")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .navigationTitle("Servicios de Acompañamiento")
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

struct AcompanamientoView_Previews: PreviewProvider {
    static var previews: some View {
        AcompanamientoView()
    }
}
