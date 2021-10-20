	//
//  Servicio.swift
//  Servicios
//
//  Created by Equipo 1 on 18/10/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Servicio: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var categoria: String
    var precio: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    /*
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    */
}
