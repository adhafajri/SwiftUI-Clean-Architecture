//
//  PokeDexRepositoryProtocol.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

protocol PokeDexRepositoryProtocol {
    func fetchPokemons(limit: Int, offset: Int) async throws -> [PokemonEntity]
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity?
}
