//
//  DetailedSessionData.swift
//  CetacApp
//
//  Created by Equipo 1 on 06/10/21.
//

import Foundation

// Variables del login
struct getLoginData: Codable {
    var id = 0
    var nombre = ""
    var email = ""
    var token = ""
    var rank = 0
}

// Variables Globales del Login
struct LoginData: Decodable {
    static var id = 0
    static var nombre = ""
    static var email = ""
    static var token = ""
    static var rank = 0
}

func setLogin(id: Int, nombre: String, email: String, rank: Int, token: String) {
    LoginData.id = id
    LoginData.nombre = nombre
    LoginData.email = email
    LoginData.rank = rank
    LoginData.token = token
}

func getId() -> Int {
    return LoginData.id
}

func getNombre() -> String {
    return LoginData.nombre
}

func getEmail() -> String {
    return LoginData.email
}

func getRank() -> Int {
    return LoginData.rank
}

func getToken() -> String {
    return LoginData.token
}

// ===========================

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

// Tanatologos

struct TanatologoListData: Decodable, Hashable {
    var error: Bool = false
    var message: String = ""
    var data: [TanatologoItemData] = []
    
    enum CodingKeys: String, CodingKey {
        case error
        case message
        case data
    }
}

struct TanatologoItemData: Decodable, Hashable {
    var id: Int
    var nombre: String
    var experiencia: String
    var activated: Bool
}

struct TanatologoData: Decodable, Hashable {
    var nombre: String = ""
    var email: String = ""
    var experiencia: String = ""
    
    enum CodingKeys: String, CodingKey {
        case nombre
        case email
        case experiencia
    }
}

// Soporte Admin

struct SoporteAdminListData: Decodable, Hashable {
    var error: Bool = false
    var message: String = ""
    var data: [SoporteAdminItemData] = []
    
    enum CodingKeys: String, CodingKey {
        case error
        case message
        case data
    }
}

struct SoporteAdminItemData: Decodable, Hashable {
    var id: Int
    var nombre: String
    var email: String
    var activated: Bool
}

struct SoporteAdminData: Decodable, Hashable {
    var nombre: String = ""
    var email: String = ""
    
    enum CodingKeys: String, CodingKey {
        case nombre
        case email
    }
}

// Reportes

struct ReporteData: Decodable {
    var usuariosPorSexo: [ReporteItemData] = []
    var usuariosPorTanatologo: [ReporteItemData] = []
    var cuotaPorTanatologo: [ReporteItemData] = []
    var cuotaTotal: Double = 0
    var motivoDeIntervencion: [ReporteItemData] = []
    var tipoDeIntervencion: [ReporteItemData] = []
    var herramientas: [ReporteItemData] = []
    
    enum CodingKeys: String, CodingKey {
        case usuariosPorSexo
        case usuariosPorTanatologo
        case cuotaPorTanatologo
        case cuotaTotal
        case motivoDeIntervencion
        case tipoDeIntervencion
        case herramientas
    }
}

struct ReporteItemData: Decodable, Hashable {
    var item: String
    var value: Double
}
