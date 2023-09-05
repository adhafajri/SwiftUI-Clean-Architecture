//
//  PokeDexRepository.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

class ExploreRepository: ExploreRepositoryProtocol {
    static let shared = ExploreRepository()
    
    private let exploreDataSource = ExploreDataSource()
    
    func fetchPokemons(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        let pokemonsListResponse: PokemonListResponseModel = try await exploreDataSource.fetchPokemons(limit: limit, offset: offset)
        let pokemonResponses: [PokemonResponseModel] = pokemonsListResponse.results
        let pokemonEntities: [PokemonEntity] = pokemonResponses.compactMap { pokemon in
            return PokemonEntity(pokemonResponse: pokemon)
        }
        
        return pokemonEntities
    }
}
