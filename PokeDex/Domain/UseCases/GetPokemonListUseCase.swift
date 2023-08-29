//
//  FetchPokemonsUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

class GetPokemonListUseCase {
    let pokeDexRepository: PokeDexRepositoryProtocol
    
    init(pokeDexRepository: PokeDexRepositoryProtocol) {
        self.pokeDexRepository = pokeDexRepository
    }
    
    func execute(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        return try await pokeDexRepository.fetchPokemons(limit: limit, offset: offset)
    }
}
