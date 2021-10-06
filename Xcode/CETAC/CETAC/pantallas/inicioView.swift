//
//  inicioView.swift
//  CETAC
//
//  Created by Christian González on 04/10/21.
//

import SwiftUI

struct inicioView: View {
    var body: some View {
        TabView {
            listaUsuariosView()
                .tabItem {
                    Label("Usuarios", systemImage: "person.fill")
                }
            
            listaTanatologosView()
                .tabItem {
                    Label("Sesiones", systemImage: "calendar")
                }
            
            listaReportesView()
                .tabItem {
                    Label("Reportes", systemImage: "waveform.path.ecg.rectangle")
                }
            
            listaReportesView()
                .tabItem {
                    Label("Ajustes", systemImage: "gear")
                }
        }
    }
}


struct inicioView_Previews: PreviewProvider {
    static var previews: some View {
        inicioView()
    }
}
