//
//  ContentView.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

struct PokemonExploreView: View {
    @StateObject private var viewModel: PokemonExploreViewModel = PokemonExploreViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.pokemonList, id: \.self) { pokemon in
                    NavigationLink(destination: PokemonDetailView(id: pokemon.id)) {
                        PokemonListView(pokemon: pokemon)
                            .onAppear(perform: {
                                viewModel.handleOnAppear(pokemon: pokemon)
                            })
                    }
                }
            }
        }
        .task {
            viewModel.loadPokemonList()
        }
    }
}

struct PokemonExploreView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonExploreView()
    }
}
