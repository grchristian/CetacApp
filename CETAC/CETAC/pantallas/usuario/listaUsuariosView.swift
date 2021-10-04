//
//  listaUsuariosView.swift
//  CETAC
//
//  Created by Christian González on 04/10/21.
//

import SwiftUI

struct listaUsuariosView: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("Christian González")
                        Text("Alejandro Hernández")
                        Text("Marco Bosquez")
                    }
                }
                .navigationBarTitle(Text("Usuarios"))
            }
        }
        
    }
}

struct listaUsuariosView_Previews: PreviewProvider {
    static var previews: some View {
        listaUsuariosView()
    }
}
