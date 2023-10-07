//
//  ExploreModule.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 01/10/23.
//

import Foundation

struct ExploreModule {
    func provideExploreDataSource() -> ExploreDataSourceProtocol {
        let networkService: NetworkServiceProtocol = NetworkService()
        
        return ExploreDataSource(networkService: networkService)
    }
    
    func provideExploreRepository(dataSource: ExploreDataSourceProtocol) -> ExploreRepositoryProtocol {
        return ExploreRepository(dataSource: dataSource)
    }
    
    func provideGetPokemonListUseCase(repository: ExploreRepositoryProtocol) -> GetPokemonListUseCaseProtocol {
        return GetPokemonListUseCase(repository: repository)
    }
    
    @MainActor func provideExploreViewModel() -> PokemonExploreViewModel {
        let dataSource = provideExploreDataSource()
        let repository = provideExploreRepository(dataSource: dataSource)
        let getPokemonListUseCase = provideGetPokemonListUseCase(repository: repository)
        
        return PokemonExploreViewModel(getPokemonListUseCase: getPokemonListUseCase)
    }
}
