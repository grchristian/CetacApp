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
                    .padding(.horizontal, 55.0)
                    .scaledToFit()
                
                Spacer()
                    .frame(height: 50)
                
                VStack(alignment: .leading) {
                    Text("Usuario")
                        .font(Font.custom("helvetica-light", size: 30))

                    TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .font(Font.custom("helvetica-light", size: 20))
                        .border(/*@START_MENU_TOKEN@*/Color(hue: 0.572, saturation: 0.963, brightness: 0.789)/*@END_MENU_TOKEN@*/, width: 0.3)

                    
                    Text("Contraseña")
                        .font(Font.custom("helvetica-light", size: 30))

                    TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .font(Font.custom("helvetica-light", size: 20))
                        .border(/*@START_MENU_TOKEN@*/Color(hue: 0.572, saturation: 0.963, brightness: 0.789)/*@END_MENU_TOKEN@*/, width: 0.3)

                }
                .padding(.horizontal, 40.0)
                
                Spacer()
                    .frame(height: 50)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Iniciar sesión")
                        .font(Font.custom("helvetica", size: 20))
                        .padding()
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(40)
                }
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Conoce CETAC")
                        .foregroundColor(.black)
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
