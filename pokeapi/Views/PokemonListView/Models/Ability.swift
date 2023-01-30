//
//  Ability.swift
//  pokeapi
//
//  Created by User-R05 on 1/29/23.
//

import Foundation

struct Ability: Codable {
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
