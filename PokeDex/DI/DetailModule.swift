//
//  DetailModule.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 01/10/23.
//

import Foundation

struct DetailModule {
    func provideDetailDataSource() -> DetailDataSourceProtocol {
        let networkService: NetworkServiceProtocol = NetworkService()
        
        return DetailDataSource(networkService: networkService)
    }
    
    func provideDetailRepository(dataSource: DetailDataSourceProtocol) -> DetailRepositoryProtocol {
        return DetailRepository(dataSource: dataSource)
    }
    
    func provideGetPokemonDetailUseCase(repository: DetailRepositoryProtocol) -> GetPokemonDetailUseCaseProtocol {
        return GetPokemonDetailUseCase(repository: repository)
    }
    
    @MainActor func provideDetailViewModel() -> PokemonDetailViewModel {
        let dataSource = provideDetailDataSource()
        let repository = provideDetailRepository(dataSource: dataSource)
        let getPokemonDetailUseCase = provideGetPokemonDetailUseCase(repository: repository)
        
        return PokemonDetailViewModel(getPokemonDetailUseCase: getPokemonDetailUseCase)
    }
}
