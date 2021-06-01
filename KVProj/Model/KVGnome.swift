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

class KVGnomeViewModel: NSObject {

    let gnome: KVGnome
    
    init(gnome: KVGnome) {
        self.gnome = gnome
    }
    
    var gnomeID: String {
        if let id = gnome.id {
            return "\(id)"
        }
        return ""
    }

    var gnomeName: String {
        return gnome.name ?? ""
    }
    
    var gnomeThumbnail: String {
        return gnome.thumbnail ?? ""
    }

    var gnomeAge: String {
        if let age = gnome.age {
            return "\(age)"
        }
        return ""
    }
    
    var gnomeWeight: String {
        if let weight = gnome.weight {
            return "\(weight)"
        }
        return ""
    }
    
    var gnomeHeight: String {
        if let height = gnome.height {
            return "\(height)"
        }
        return ""
    }
    
    var gnomeHairColor: String {
        return gnome.hairColor ?? ""
    }

    var gnomeProfessions: [String] {
        return gnome.professions ?? []
    }
    
    var gnomeFriends: [String] {
        return gnome.friends ?? []
    }
}

