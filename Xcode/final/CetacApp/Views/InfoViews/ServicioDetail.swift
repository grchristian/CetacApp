//
//  ServicioDetail.swift
//  Servicios
//
//  Created by Equipo 1 on 18/10/21.
//

import SwiftUI

struct ServicioDetail: View {
    var servicio : Servicio

    var body: some View {
        ScrollView {
            CircleImage(image: servicio.image)
                .ignoresSafeArea(edges: .top)
                .padding(.bottom, 120)
            
            VStack(alignment: .leading) {
                
                Text(servicio.name)
                    .font(.title)
                 
                HStack {
                    Text(servicio.categoria)
                    Spacer()
                    //Text(servicio.precio)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()
                
                /*
                Text("Sobre \(servicio.name)")
                    .font(.title2)
                 */
                Text(servicio.description)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
        }
        .navigationTitle(servicio.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct ServicioDetail_Previews: PreviewProvider {
    static var previews: some View {
        ServicioDetail(servicio: servicios[0])
    }
}
