//
//  PokemonModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

struct PokemonModel: Hashable {
    let id: Int
    let name: String
    var imageURL: URL?
    
    init?(pokemon: PokemonEntity) {
        self.id = pokemon.id
        self.name = pokemon.name
        self.imageURL = URL(string: pokemon.imageURL)
    }
}
