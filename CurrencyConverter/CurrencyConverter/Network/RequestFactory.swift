//
//  RequestFactory.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 22/01/2021.
//

import Foundation

final class RequestFactory {
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    static func request(method: Method, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
