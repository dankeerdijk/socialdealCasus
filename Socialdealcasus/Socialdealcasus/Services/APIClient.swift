//
//  APIClient.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

protocol APIClientProtocol {
    func get<T: Decodable>(_ url: URL) async throws -> T
}

final class APIClient: APIClientProtocol {
    func get<T: Decodable>(_ url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        if let http = response as? HTTPURLResponse,
           !(200...299).contains(http.statusCode) {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        } catch {
            throw error
        }
    }
}
