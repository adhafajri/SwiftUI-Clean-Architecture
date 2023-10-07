//
//  NetworkService.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Codable>(from url: URL, timeoutInterval: Double) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    func fetch<T: Codable>(from url: URL, timeoutInterval: Double = 15.0) async throws -> T {
        var request = URLRequest(url: url)
        request.timeoutInterval = timeoutInterval
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}
