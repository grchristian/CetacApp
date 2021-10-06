//
//  listaReportesView.swift
//  CETAC
//
//  Created by Christian González on 04/10/21.
//

import SwiftUI

struct listaReportesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("Usuarios por día")
                        Text("Servicios más solicitados")
                        Text("Tanatólogs con mas usuarios")
                    }
                }
                .navigationBarTitle(Text("Reportes"))
            }
        }
        
    }
}

struct listaReportesView_Previews: PreviewProvider {
    static var previews: some View {
        listaReportesView()
    }
}
