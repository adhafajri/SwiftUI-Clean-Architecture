//
//  GetPokemonDetailUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 29/08/23.
//

import Foundation

protocol GetPokemonDetailUseCaseProtocol {
    func execute(id: Int) async throws -> PokemonDetailEntity?
}

class GetPokemonDetailUseCase: GetPokemonDetailUseCaseProtocol {
    let repository: DetailRepositoryProtocol
    
    init(repository: DetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> PokemonDetailEntity? {
        guard let pokemonDetail: PokemonDetailEntity = try await repository.fetchPokemonDetail(id: id) else {
            return nil
        }
        
        return pokemonDetail
    }
}
