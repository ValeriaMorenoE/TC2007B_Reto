//
//  noticiaAPI.swift
//  TC2007B_Reto
//
//  Created by Alumno on 14/10/21.
//

import Foundation

// MARK: - WelcomeElement
struct Noticia: Decodable {
    let id, title, subtitle, date: String
    let description: String
    let imageURL: String?
}
