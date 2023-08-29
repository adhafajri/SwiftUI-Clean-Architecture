//
//  PokeDexRepository.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

class PokeDexRepository: PokeDexRepositoryProtocol {
    static let shared = PokeDexRepository()
    
    private let pokeDexDataSource = PokeDexDataSource()
    
    func fetchPokemons(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        let pokemonsListResponse: PokemonListResponseModel = try await pokeDexDataSource.fetchPokemons(limit: limit, offset: offset)
        let pokemonResponses: [PokemonResponseModel] = pokemonsListResponse.results
        let pokemonEntities: [PokemonEntity] = pokemonResponses.compactMap { pokemon in
            return PokemonEntity(pokemonResponse: pokemon)
        }
        
        return pokemonEntities
    }
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity? {
        let pokemonDetailResponse: PokemonDetailReponseModel = try await pokeDexDataSource.fetchPokemonDetail(id: id)
        
        guard let pokemonDetail: PokemonDetailEntity = PokemonDetailEntity(pokemonDetailResponse: pokemonDetailResponse) else {
            return nil
        }
        
        return pokemonDetail
    }
}
