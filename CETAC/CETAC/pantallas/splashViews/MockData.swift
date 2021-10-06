import UIKit
import SwiftUI

struct PageData {
    let title: String
    let header: String
    let content: String
    let imageName: String
    let color: Color
    let textColor: Color
}

struct MockData {
    static let pages: [PageData] = [
        PageData(
            title: "CETAC",
            header: "Filosofía",
            content: "Reconocer, comprender y apreciar las emociones y sentimientos de los demás.",
            imageName: "loginPic",
            color: Color(hex: "F38181"),
            textColor: Color(hex: "FFFFFF")),
        PageData(
            title: "Valores",
            header: "Respeto",
            content: "Dar valía a la ideología de cada individuo respetando sus creencias, estatus económico o género.",
            imageName: "loginPic",
            color: Color(hex: "FCE38A"),
            textColor: Color(hex: "4A4A4A")),
        PageData(
            title: "Objetivos",
            header: "Apoyar",
            content: "Apoyar a personas de escasos recursos con algún tipo de discapacidad para satisfacer sus necesidades humanas de acuerdo a la pirámide de Maslow",
            imageName: "loginPic",
            color: Color(hex: "95E1D3"),
            textColor: Color(hex: "4A4A4A")),
        PageData(
            title: "Objetivos",
            header: "capacitación y orientación",
            content: "Brindar cuidado, capacitación y orientación tanto emocional, psicológica y espiritualmente a los adultos mayores, personas con enfermedades, personas con enfermedades crónico-degenerativas y en fase terminal, como también a sus familiares.",
            imageName: "loginPic",
            color: Color(hex: "EAFFD0"),
            textColor: Color(hex: "4A4A4A")),
    ]
}

/// Color converter from hex string to SwiftUI's Color
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
