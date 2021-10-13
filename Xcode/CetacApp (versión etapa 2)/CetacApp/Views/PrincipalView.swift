//
//  inicioView.swift
//  CETAC
//
//  Created by Christian González on 04/10/21.
//

import SwiftUI

struct PrincipalView: View {
    var admin = false
    var body: some View {
        TabView {
            UserListView()
                .tabItem {
                    Label("Usuarios", systemImage: "person.fill")
                }
            if(admin) {
                TanatologoListView()
                    .tabItem {
                        Label("Tanatólogos", systemImage: "person.fill.and.arrow.left.and.arrow.right")
                    }
                
                //Text("Aquí se pueden generar reportes")
                ChartTestView()
                    .tabItem {
                        Label("Reportes", systemImage: "waveform.path.ecg.rectangle")
                    }
            }
            Text("Aquí se pueden hacer ajustes adicionales")
                .tabItem {
                    Label("Ajustes", systemImage: "gear")
                }
        }
    }
}


struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalView()
    }
}
