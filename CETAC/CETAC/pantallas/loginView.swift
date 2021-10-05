//
//  loginView.swift
//  CETAC
//
//  Created by Christian González on 30/09/21.
//

import SwiftUI

struct loginView: View {
    var body: some View {
        ZStack {
            Color(red: 0.964, green: 0.972, blue: 0.972)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .padding(.horizontal, 50.0)
                    .scaledToFit()
                VStack {
                    TextField("Usuario", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    TextField("Contraseña", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Iniciar sesión")
                    }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Conoce CETAC")
                    }
            }
        }
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
.previewInterfaceOrientation(.portrait)
    }
}
