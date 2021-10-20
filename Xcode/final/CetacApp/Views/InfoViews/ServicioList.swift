//
//  ServiciosList.swift
//  Servicios
//
//  Created by Equipo 1 on 18/10/21.
//

import SwiftUI

struct ServicioList: View {
    
    @State var categoria: String = ""
    
    var body: some View {
            List(servicios) { servicio in
                if(servicio.categoria == categoria) {
                    NavigationLink(destination: ServicioDetail(servicio: servicio)) {
                        ServicioRow(servicio: servicio)
                    }
                }
            }
            .navigationTitle(categoria)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ServicioList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            ServicioList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
