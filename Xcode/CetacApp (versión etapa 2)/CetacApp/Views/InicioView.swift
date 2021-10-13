//
//  InicioView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 29/09/21.
//

import SwiftUI

struct InicioView: View {
    @State var showInfoModalView: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    NavigationLink(destination: CetacInfoView()) {
                        Image("cetac")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                    }
                    NavigationLink(destination: AcompanamientoView()) {
                        ZStack {
                            Image("acompanamiento")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            Text("Servicios de Acompañamiento")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    NavigationLink(destination: HolisticosView()) {
                        ZStack {
                            Image("holisticos")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            Text("Servicios Holísticos")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    NavigationLink(destination: AlternativasView()) {
                        ZStack {
                            Image("alternativas")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            Text("Herramientas Alternativas")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            .navigationTitle("CetacApp")
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
}

struct InicioView_Previews: PreviewProvider {
    static var previews: some View {
        InicioView()
    }
}
