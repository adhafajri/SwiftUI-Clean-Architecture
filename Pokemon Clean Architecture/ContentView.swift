//
//  ContentView.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

struct Pokemon: Identifiable, Decodable {
    let id: Int
    let name: String
    var imageUrl: URL? {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
    }
}

struct PokemonList: Decodable {
    let results: [PokemonResult]
}

struct PokemonResult: Decodable {
    let name: String
    let url: String
}

struct ContentView: View {
    @State private var pokemonList: [Pokemon] = []
    
    var body: some View {
        List {
            ForEach(pokemonList) { pokemon in
                PokemonView(pokemon: pokemon)
            }
        }
        .task {
            do {
                pokemonList = try await getPokemonList()
            } catch {
                print("error")
            }
        }
    }
    
    func getPokemonList() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=50") else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        var pokemons = [Pokemon]()
        
        let pokemonList = try JSONDecoder().decode(PokemonList.self, from: data)
        
        for (index, result) in pokemonList.results.enumerated() {
            let pokemon = Pokemon(id: index + 1, name: result.name)
            pokemons.append(pokemon)
        }
        
        return pokemons
    }
}

struct PokemonView: View {
    var pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.imageUrl) { image in
                image
                    .image?
                    .resizable()
            }
            .scaledToFit()
            .frame(width: 100, height: 100)
            Text(pokemon.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
