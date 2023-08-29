//
//  PokemonDetailResponseModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

struct PokemonDetailReponseModel: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}
