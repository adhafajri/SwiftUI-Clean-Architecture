//
//  DetailRepositoryProtocol.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

protocol DetailRepositoryProtocol {
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity?
}
