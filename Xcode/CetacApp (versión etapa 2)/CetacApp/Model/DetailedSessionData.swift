//
//  DetailedSessionData.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 06/10/21.
//

import Foundation

// Detalles de la sesión
struct SessionData: Decodable {
    var fecha: String = ""
    var motivo: String = ""
    var intervencion: String = ""
    var herramienta: String = ""
    var evaluacion: String = ""
    var cuota: Double = 0
    
    enum CodingKeys: String, CodingKey {
        case fecha
        case motivo
        case intervencion
        case herramienta
        case evaluacion
        case cuota
    }
}

// Detalles del usuario
struct UserData: Decodable {
    var nombre: String = ""
    var edad: Int = 0
    var sexo: String = ""
    var ocupacion: String = ""
    var religion: String = ""
    var procedencia: String = ""
    
    var calle: String = ""
    var interior: String = ""
    var colonia: String = ""
    var alcaldia: String = ""
    var cp: String = ""
    var telefono: String = ""
    var movil: String = ""
    
    var motivo: String = ""
    var identificacionRespuesta: String = ""
    var ekr: String = ""
    
    var hijos: [HijoData] = []
    var sesiones: [SesionData] = []
    
    var totalSesiones: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case nombre
        case edad
        case sexo
        case ocupacion
        case religion
        case procedencia
        
        case calle
        case interior
        case colonia
        case alcaldia
        case cp
        case telefono
        case movil
        
        case motivo
        case identificacionRespuesta
        case ekr
        
        case hijos
        case sesiones
        
        case totalSesiones
    }
}

struct HijoData: Decodable, Hashable {
    var nombre: String
    var edad: Int
    var sexo: String
}

struct SesionData: Decodable, Hashable {
    var id: Int
    var sesion: Int
    var fecha: String
    var tanatologo: Int
    var nombreTanatologo: String
}
