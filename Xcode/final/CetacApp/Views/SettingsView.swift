//
//  SettingsView.swift
//  CetacApp
//
//  Created by Equipo 1 on 17/10/21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isPresentedChangePassword = false
    
    var body: some View {
        NavigationView {
            Form() {
                Section(header: Text("Cuenta")) {
                    HStack {
                        Text("Nombre")
                        Spacer(minLength: 100)
                        Text(getNombre())
                    }
                    HStack {
                        Text("Correo")
                        Spacer(minLength: 100)
                        Text(getEmail())
                    }
                    HStack {
                        Text("Rango")
                        Spacer(minLength: 100)
                        Text(getRank() == 1 ? "Administrador" : getRank() == 2 ? "Admin Soporte" : "Tanatólogo")
                    }
                }
                
                Section() {
                    Button("Cambiar contraseña") {
                        isPresentedChangePassword.toggle()
                    }
                    .sheet(isPresented: $isPresentedChangePassword) {
                        ChangePasswordView(isPresented: $isPresentedChangePassword, id: getId())
                    }
                    Button("Cerrar sesión") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Ajustes")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
