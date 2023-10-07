//
//  PokemonExploreViewModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

@MainActor
class PokemonExploreViewModel: ObservableObject {
    private let getPokemonListUseCase: GetPokemonListUseCaseProtocol
    
    @Published var pokemonList: [PokemonModel] = [PokemonModel]()
    @Published var offset: Int = 20
    
    init(getPokemonListUseCase: GetPokemonListUseCaseProtocol) {
        self.getPokemonListUseCase = getPokemonListUseCase
    }
    
    func handleOnPokemonListAppear(pokemon: PokemonModel) {
        guard pokemonList.last == pokemon else { return }
        
        increaseOffset(value: PokeAPI.pokemonListlimit)
        loadPokemonList()
    }
    
    func loadPokemonList() {
        Task {
            do {
                let pokemonEntityList = try await getPokemonListUseCase.execute(limit: 20, offset: offset)
                pokemonList += pokemonEntityList.compactMap({ pokemon in PokemonModel(pokemon: pokemon) })
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func increaseOffset(value: Int) {
        offset += value
    }
}
