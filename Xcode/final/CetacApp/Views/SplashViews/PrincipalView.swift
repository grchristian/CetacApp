//
//  inicioView.swift
//  CETAC
//
//  Created by Equipo 1 on 04/10/21.
//

import SwiftUI

struct PrincipalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var admin = false
    
    var body: some View {
        TabView {
            UserListView()
                .tabItem {
                    Label("Usuarios", systemImage: "person.fill")
                }

            if(getRank() == 1 || getRank() == 2) {
                TanatologoListView()
                    .tabItem {
                        Label("Tanatólogos", systemImage: "person.fill.and.arrow.left.and.arrow.right")
                    }
            }
            
            if(getRank() == 1) {
                SoporteAdminListView()
                    .tabItem {
                        Label("Soporte Admin", systemImage: "person.crop.circle.badge.exclamationmark")
                    }
                
                ReportesView()
                    .tabItem {
                        Label("Reportes", systemImage: "waveform.path.ecg.rectangle")
                    }
            }

            SettingsView()
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
