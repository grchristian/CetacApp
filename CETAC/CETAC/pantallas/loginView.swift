//
//  loginView.swift
//  CETAC
//
//  Created by Christian González on 30/09/21.
//

import SwiftUI

struct loginView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                VStack {
                    Text("CETAPP")
                    TextField("Usuario", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    TextField("Contraseña", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Iniciar sesión")
                }
                
                Spacer()
                
                NavigationLink(destination: conoceCetacView()) {
                    Text("Conoce CETAC")
                }
            }
            
        }
            
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
