//
//  Constants.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

struct PokeAPI {
    static let baseURL: String = "https://pokeapi.co/api/v2/"
    static let artworkURL: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/%d.png"
    static let pokemonListlimit: Int = 20
    static let timeoutInterval: Double = 15.0
    
    enum Endpoint {
        case getPokemonList(limit: Int, offset: Int)
        case getPokemonImage(id: Int)
        case getPokemonDetails(id: Int)
        case getPokemonElements(id: Int)
        var url: URL? {
            switch self {
            case .getPokemonList(let limit, let offset):
                return URL(string: "\(baseURL)pokemon?limit=\(limit)&offset=\(offset)")
            case .getPokemonImage(let id):
                return URL(string: String(format: artworkURL, id))
            case .getPokemonDetails(let id):
                return URL(string: "\(baseURL)pokemon/\(id)/")
            case .getPokemonElements(let id):
                return URL(string: "\(baseURL)pokemon/\(id)/")
            }
        }
    }
}
