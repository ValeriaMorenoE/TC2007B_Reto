//
//  exposicionesAPI.swift
//  TC2007B_Reto
//
//  Created by Alumno on 06/10/21.
//

import Foundation

// MARK: - WelcomeElement
struct Expo: Decodable {
    let id, title, startDate, description: String
    let cerraduria, museografia, salas, tecnica: String
    let obras: String?
    let recorridoVirtual, videoUrl: String?
    let photoUrl: String
}

struct Noticia: Decodable {
    let id, title, subtitle, date: String
    let description: String
    let photoUrl: String?
}

struct Evento: Decodable {
    let id: String
    let events: [String]
    let date: String
}

struct Visita: Codable {
    let id, guide, date: String
}
