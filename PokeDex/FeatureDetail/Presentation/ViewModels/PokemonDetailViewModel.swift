//
//  PokemonDetailViewModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 03/09/23.
//

import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    let getPokemonDetailUseCase: GetPokemonDetailUseCaseProtocol
    
    @Published var pokemonDetail: PokemonDetailModel?
    
    init(getPokemonDetailUseCase: GetPokemonDetailUseCaseProtocol) {
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }
    
    func loadDetail(id: Int) {
        Task {
            do {
                guard let pokemonDetailEntity: PokemonDetailEntity = try await getPokemonDetailUseCase.execute(id: id) else {
                    return
                }
                
                self.pokemonDetail = PokemonDetailModel(pokemonDetail: pokemonDetailEntity)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
