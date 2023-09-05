//
//  PokemonModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

struct PokemonResponseModel: Decodable, Encodable {
    let name: String
    let url: String
}
