//
//  PokemonListResponseModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

struct PokemonListResponseModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonResponseModel]
}
