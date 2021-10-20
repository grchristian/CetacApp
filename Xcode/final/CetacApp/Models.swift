//
//  Models.swift
//  CetacApp
//
//  Created by Equipo 1 on 01/10/21.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [PostModel]
}

struct PostModel: Decodable, Hashable {
    let id: Int
    let nombre: String
    let fechaDeNacimiento: String
}
