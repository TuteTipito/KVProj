//
//  KVGnome.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit

struct KVGnomes: Codable {
    let Brastlewark: [KVGnome]?
}

struct KVGnome: Codable {
    let id: Int?
    let name: String?
    let thumbnail: String?
    let age: Int?
    let weight: Double?
    let height: Double?
    let hair_color: String?
    let professions: [String]?
    let friends: [String]?
}
