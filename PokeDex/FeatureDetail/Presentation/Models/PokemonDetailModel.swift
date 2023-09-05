//
//  PokemonDetailModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 03/09/23.
//

import Foundation

struct PokemonDetailModel {
    let pokemon: PokemonModel
    let height: Int
    let weight: Int
    
    init?(pokemonDetail: PokemonDetailEntity) {
        guard let pokemon = PokemonModel(pokemon: pokemonDetail.pokemon) else {
            return nil
        }
        
        self.pokemon = pokemon
        self.height = pokemonDetail.height
        self.weight = pokemonDetail.weight
    }
}
