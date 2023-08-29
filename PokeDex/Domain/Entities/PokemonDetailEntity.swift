//
//  PokemonDetailEntity.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

struct PokemonDetailEntity {
    let pokemon: PokemonEntity
    let height: Int
    let weight: Int
    
    init?(pokemonDetailResponse: PokemonDetailReponseModel) {
        guard let pokemon = PokemonEntity(pokemonDetailResponse: pokemonDetailResponse) else {
            return nil
        }
        
        self.pokemon = pokemon
        self.height = pokemonDetailResponse.height
        self.weight = pokemonDetailResponse.weight
    }
}
