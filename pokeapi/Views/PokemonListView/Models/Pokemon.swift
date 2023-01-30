//
//  Pokemon.swift
//  pokeapi
//
//  Created by User-R05 on 1/29/23.
//

import Foundation

struct Pokemon: Codable {
    let name: String?
    let abilities: [Ability]?
    let order: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case abilities
        case order
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.abilities = try values.decodeIfPresent(Array<Ability>.self, forKey: .abilities)
        self.order = try values.decodeIfPresent(Int.self, forKey: .order)
    }
}
