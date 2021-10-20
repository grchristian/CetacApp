//
//  ServicioRow.swift
//  Servicios
//
//  Created by Equipo 1 on 18/10/21.
//

import SwiftUI

struct ServicioRow: View {
    var servicio: Servicio

    var body: some View {
        HStack {
            servicio.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding(5)
            Text(servicio.name)

            Spacer()
        }
    }
}

struct ServicioRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ServicioRow(servicio: servicios[0])
            ServicioRow(servicio: servicios[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
