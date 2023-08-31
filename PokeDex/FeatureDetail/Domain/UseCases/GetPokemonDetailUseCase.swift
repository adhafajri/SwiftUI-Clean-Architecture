//
//  GetPokemonDetailUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 29/08/23.
//

import Foundation

class GetPokemonDetailUseCase {
    let pokeDexRepository: PokeDexRepositoryProtocol
    
    init(pokeDexRepository: PokeDexRepositoryProtocol) {
        self.pokeDexRepository = pokeDexRepository
    }
    
    func execute(id: Int) async throws -> PokemonDetailEntity? {
        guard let pokemonDetail: PokemonDetailEntity = try await pokeDexRepository.fetchPokemonDetail(id: id) else {
            return nil
        }
        
        return pokemonDetail
    }
}
