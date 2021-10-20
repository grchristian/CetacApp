//
//  InicioView.swift
//  CetacApp
//
//  Created by Equipo 1 on 29/09/21.
//

import SwiftUI

struct HomeView: View {
    @State var showInfoModalView: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    NavigationLink(destination: ServicioList(categoria: "Cetac")) {
                        Image("cetac")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                    }
                    NavigationLink(destination: ServicioList(categoria: "Servicios de acompañamiento")) {
                        ZStack {
                            Image("acompanamiento")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
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
                    NavigationLink(destination: ServicioList(categoria: "Servicios holísticos")) {
                        ZStack {
                            Image("holisticos")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
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
                    NavigationLink(destination: ServicioList(categoria: "Herramientas alternativas")) {
                        ZStack {
                            Image("alternativas")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
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
                LoginView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
