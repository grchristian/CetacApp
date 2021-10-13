//
//  CetacInfoView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 06/10/21.
//

import SwiftUI

struct CetacInfoView: View {
    @State var showInfoModalView: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                NavigationLink(destination: InformacionView(titulo: "Misión", texto: "Acompañar, guiar y encauzar a personas, pacientes con alguna enfermedad y a sus familiares a través de la tanatología mejorando su estado emocional, físico, psicológico y espiritual logrando reencuentren un sentido a la vida; asimismo proporcionar un servicio de ambulancia para traslados, asumiendo nuestro compromiso y calidad humana con cada uno de ellos.")) {
                    ZStack {
                        Image("mision")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                        Text("Misión")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Visión", texto: "Ser la mejor opción en el servicio en tanatología y traslado en ambulancia en la Ciudad de México ampliando nuestros servicios en el interior de la República Mexicana asumiendo nuestro compromiso de ofrecer beneficios a las personas con calidez humana.")) {
                    ZStack {
                        Image("vision")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Visión")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Valores", texto: "Respeto: Dar valía a la ideología de cada individuo respetando sus creencias, estatus económico o género.\n\nHonestidad: Conducirnos con la verdad y transparencia con todos los individuos, asociados y aliados.\n\nEmpatía: Reconocer, comprender y apreciar las emociones y sentimientos de los demás.\n\nIntegridad: Conducirnos con rectitud y ética en las ideas, creencias y comportamientos de nuestros colaboradores con la interacción con la comunidad.\n\nHumildad: Tener la sabiduría de reconocer y respetar las habilidades, cualidades, capacidades y aptitudes del ser humano.")) {
                    ZStack {
                        Image("valores")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Valores")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                NavigationLink(destination: InformacionView(titulo: "Objetivos", texto: "Apoyar a personas de escasos recursos con algún tipo de discapacidad para satisfacer sus necesidades humanas de acuerdo a la pirámide de Maslow: fisiológicas, de seguridad, de pertenencia, reconocimiento y autorrealización, a través de la disciplina de tanatología y servicios de traslado en ambulancia.\n\nBrindar cuidado, capacitación y orientación tanto emocional, psicológica y espiritualmente a los adultos mayores, personas con enfermedades, personas con enfermedades crónico-degenerativas y en fase terminal, como también a sus familiares. Asimismo, proporcionando contención a cualquier tipo de pérdida significativa y por muerte logrando reencuentren un nuevo sentido a la vida.\n\nDar acompañamiento y consejería a personas y pacientes que enfrentan situaciones en crisis, estrés postraumático, abusos, maltratos, así como situaciones que provocan pérdidas de distinta índole: pérdida de un familiar, de una extremidad del cuerpo, de autoestima, de identidad, laboral, bienes materiales; infertilidad, anorexia, bulimia, intentos de suicidio, viudez, divorcio, violencia intrafamiliar, infidelidad, portadores de VIH-SIDA o personas con enfermedades en fase terminal, entre otras. También se da acompañamiento a los familiares que son afectados por la situación y el entorno.")) {
                    ZStack {
                        Image("objetivo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        Text("Objetivos")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .navigationTitle("Cetac")
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

struct CetacInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CetacInfoView()
    }
}
