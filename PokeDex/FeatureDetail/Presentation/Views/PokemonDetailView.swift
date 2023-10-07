//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import SwiftUI

struct PokemonDetailView: View {
    var id: Int
    
    @StateObject private var viewModel: PokemonDetailViewModel
    
    init(id: Int, viewModel: PokemonDetailViewModel) {
        self.id = id
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if viewModel.pokemonDetail == nil {
                Text("Loading...")
            } else {
                AsyncImage(url: viewModel.pokemonDetail?.pokemon.imageURL) { image in
                    image.image?.resizable()
                }
                .scaledToFit()
                
                Text(viewModel.pokemonDetail?.pokemon.name ?? "")
                    .font(.title)
                
                HStack {
                    Text("Height: \(viewModel.pokemonDetail?.height ?? 0)")
                        .font(.subheadline)
                    Text("Weight: \(viewModel.pokemonDetail?.weight ?? 0)")
                        .font(.subheadline)
                }
            }
        }
        .task {
            viewModel.loadDetail(id: id)
        }
    }
}

#Preview {
    PokemonDetailView(id: 1, viewModel: DetailModule().provideDetailViewModel())
}
