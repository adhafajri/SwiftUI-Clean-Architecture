//
//  PokeDexDataSource.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

protocol ExploreDataSourceProtocol {
    func fetchPokemons(limit: Int, offset: Int) async throws -> PokemonListResponseModel
}

class ExploreDataSource: ExploreDataSourceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchPokemons(limit: Int, offset: Int) async throws -> PokemonListResponseModel {
        guard let url: URL = PokeAPI.Endpoint.getPokemonList(limit: limit, offset: offset).url else {
            throw URLError(.badURL)
        }
        
        return try await networkService.fetch(from: url, timeoutInterval: PokeAPI.timeoutInterval)
    }
}
