//
//  exposicionesAPI.swift
//  TC2007B_Reto
//
//  Created by Alumno on 06/10/21.
//

import Foundation

// MARK: - WelcomeElement
struct Expo: Decodable {
    let id, title, startDate, welcomeDescription: String
    let cerraduria, museografia, salas, tecnica: String
    let obras: String?
    let recorridoVirtual, videoURL: String?
}
