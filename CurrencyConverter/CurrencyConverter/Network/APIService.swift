//
//  APIService.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, CCError>
}


protocol CCService {
    var apiSession: APIService { get }
    
    func getCurrencyLists() -> AnyPublisher<ListResponse, CCError>
    func getCurrencyLive() -> AnyPublisher<LiveResponse, CCError>
}

extension CCService {
    
    func getCurrencyLists() -> AnyPublisher<ListResponse, CCError> {
        return apiSession.request(with: CurrencyConverterEndpoint.list)
            .eraseToAnyPublisher()
    }
    
    func getCurrencyLive() -> AnyPublisher<LiveResponse, CCError> {
        return apiSession.request(with: CurrencyConverterEndpoint.live)
            .eraseToAnyPublisher()
    }
}

struct CLError: Codable, Equatable {
    var code: Int
    var info: String
}
