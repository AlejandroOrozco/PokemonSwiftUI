//
//  Pokemon.swift
//  Pokemon
//
//  Created by Alejandro Orozco Builes on 24/06/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import SwiftUI

struct Pokemon: Equatable {
    var id = UUID()
    var name: String
    var color: Color
    var types: [String]
    var height: Int
    var weight: Int
}

struct TestData {
    static let pokemons: [Pokemon] =
        [Pokemon(name: "pikachu", color: .yellow, types: ["Eletric"], height: 4, weight: 60),
         Pokemon(name: "bulbasaur", color: .green, types: ["Poison", "Grass"], height: 7, weight: 69),
         Pokemon(name: "pidgeot", color: .orange, types: ["Flying", "Normal"], height: 15, weight: 395),
         Pokemon(name: "mewtwo", color: .purple, types: ["Psychic"], height: 20, weight: 1220)]
}
