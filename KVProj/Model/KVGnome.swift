//
//  KVGnome.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

struct KVGnomes: Codable {
    let brastlewark: [KVGnome]?
    
    enum CodingKeys: String, CodingKey {
        case brastlewark = "Brastlewark"
    }
}

struct KVGnome: Codable {
    let id: Int?
    let name: String?
    let thumbnail: String?
    let age: Int?
    let weight: Double?
    let height: Double?
    let hairColor: String?
    let professions: [String]?
    let friends: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case age
        case weight
        case height
        case hairColor = "hair_color"
        case professions
        case friends
    }
    
}
