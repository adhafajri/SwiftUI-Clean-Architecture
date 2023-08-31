//
//  PokeDexDataSource.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

class ExploreDataSource {
    func fetchPokemons(limit: Int, offset: Int) async throws -> PokemonListResponseModel {
        guard let url: URL = Constants.APIEndpoint.getPokemonList(limit: limit, offset: offset).url else {
            throw URLError(.badURL)
        }
        
        return try await NetworkUtils.shared.fetch(from: url)
    }
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailReponseModel {
        guard let url: URL = Constants.APIEndpoint.getPokemonDetails(id: id).url else {
            throw URLError(.badURL)
        }
        
        return try await NetworkUtils.shared.fetch(from: url)
    }
}
