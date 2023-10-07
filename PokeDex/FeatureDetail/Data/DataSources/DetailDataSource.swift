//
//  ExploreDataSource.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

protocol DetailDataSourceProtocol {
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailReponseModel
}

class DetailDataSource: DetailDataSourceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailReponseModel {
        guard let url: URL = PokeAPI.Endpoint.getPokemonDetails(id: id).url else {
            throw URLError(.badURL)
        }
        
        return try await networkService.fetch(from: url, timeoutInterval: PokeAPI.timeoutInterval)
    }
}
