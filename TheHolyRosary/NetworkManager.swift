//
//  NetworkingCall.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/19/24.
//

import Foundation

class NetworkManager {
    
    static func getRequest<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: "https://the-rosary-api.vercel.app/v1/\(endpoint)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
