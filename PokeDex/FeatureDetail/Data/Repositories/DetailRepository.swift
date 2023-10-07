//
//  DetailRepository.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

class DetailRepository: DetailRepositoryProtocol {
    private let dataSource: DetailDataSourceProtocol
    
    init(dataSource: DetailDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity? {
        let pokemonDetailResponse: PokemonDetailReponseModel = try await dataSource.fetchPokemonDetail(id: id)
        
        guard let pokemonDetail: PokemonDetailEntity = PokemonDetailEntity(pokemonDetailResponse: pokemonDetailResponse) else {
            return nil
        }
        
        return pokemonDetail
    }
}
