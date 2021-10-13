//
//  InformacionView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 06/10/21.
//

import SwiftUI

struct InformacionView: View {
    var titulo = "Titulo"
    var texto = "Texto"
    	
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text(texto)
                    .multilineTextAlignment(.leading)
                    .font(.system(size:20, design: .rounded))
                    .padding(25)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle(titulo)
        }
    }
}

struct InformacionView_Previews: PreviewProvider {
    static var previews: some View {
        InformacionView()
    }
}
