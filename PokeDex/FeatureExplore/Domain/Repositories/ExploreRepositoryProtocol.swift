//
//  PokeDexRepositoryProtocol.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

protocol ExploreRepositoryProtocol {
    func fetchPokemons(limit: Int, offset: Int) async throws -> [PokemonEntity]
}
