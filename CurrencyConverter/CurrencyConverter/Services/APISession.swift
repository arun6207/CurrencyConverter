//
//  APISession.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import Foundation
import Combine

struct APISession: APIService {
    
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, CCError> where T: Decodable {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let urlRequest = builder.urlRequest else {
            return Fail(error: .invalidURL)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknownError }
            .flatMap { data, response -> AnyPublisher<T, CCError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError {_ in .decodeError}
                            .eraseToAnyPublisher()
                    } else {
                        return Fail(error: CCError.checkErrorCode(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: .unknownError)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
