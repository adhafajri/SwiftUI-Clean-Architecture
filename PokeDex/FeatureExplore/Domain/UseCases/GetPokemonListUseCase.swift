//
//  FetchPokemonsUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

class GetPokemonListUseCase {
    let repository: ExploreRepositoryProtocol
    
    init(pokeDexRepository: ExploreRepositoryProtocol) {
        self.repository = pokeDexRepository
    }
    
    func execute(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        return try await repository.fetchPokemons(limit: limit, offset: offset)
    }
}
