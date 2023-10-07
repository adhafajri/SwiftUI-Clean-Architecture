//
//  ContentView.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

struct PokemonExploreView: View {
    @StateObject private var viewModel: PokemonExploreViewModel
    
    init(viewModel: PokemonExploreViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            ForEach(viewModel.pokemonList, id: \.self) { pokemon in
                NavigationLink(destination:
                                PokemonDetailView(
                                    id: pokemon.id,
                                    viewModel: DetailModule().provideDetailViewModel()
                                )) {
                    PokemonListView(pokemon: pokemon)
                        .onAppear(perform: {
                            viewModel.handleOnPokemonListAppear(pokemon: pokemon)
                        })
                }
            }
        }
        .task {
            viewModel.loadPokemonList()
        }
    }
}

#Preview {
    PokemonExploreView(viewModel: ExploreModule().provideExploreViewModel())
}
