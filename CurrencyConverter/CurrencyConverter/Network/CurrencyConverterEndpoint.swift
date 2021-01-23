//
//  CurrencyConverterEndpoint.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import Foundation

enum CurrencyConverterEndpoint: String {
    case list
    case live
}

extension CurrencyConverterEndpoint: RequestBuilder {
    
    var path: String {
        return self.rawValue
    }
    
    var httpTimeout: Double {
        return 60.0
    }
    
    var queryParamertes: [String : String] {
        return [:]
    }
    
    var httpRequestType: RequestFactory.Method {
        switch self {
        case .live:
            return .GET
        default:
            return .GET
        }
    }
}
