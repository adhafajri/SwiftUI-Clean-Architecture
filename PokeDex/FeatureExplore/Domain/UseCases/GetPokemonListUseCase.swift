//
//  FetchPokemonsUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

protocol GetPokemonListUseCaseProtocol {
    func execute(limit: Int, offset: Int) async throws -> [PokemonEntity]
}

class GetPokemonListUseCase: GetPokemonListUseCaseProtocol {
    let repository: ExploreRepositoryProtocol
    
    init(repository: ExploreRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        return try await repository.fetchPokemons(limit: limit, offset: offset)
    }
}
