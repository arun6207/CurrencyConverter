//
//  RequestBuilder.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 22/01/2021.
//

import Foundation

let baseUrl = "http://api.currencylayer.com/"
let appId = "439589411866ff4f3bdba122fcc0b268"

protocol RequestBuilder {
    
    /// API Path for the request - should not start with "/"
    var path: String { get }
    
    /// Optional - Defaults to 60.0
    var httpTimeout: Double { get }
    
    /// Optional - Defaults to nil
    var queryParamertes: [String : String] { get }
    
    var httpRequestType: RequestFactory.Method { get }
}

extension RequestBuilder {
    
    var httpTimeout: Double {
         60.0
    }
    
    var queryParamertes: [String : String] {
        return [:]
    }
    
    var urlRequest: URLRequest? {
        return buildRequest()
    }
    
    func buildRequest() -> URLRequest? {
        assert(!path.hasPrefix("/"), "Path should NOT start with a '/'")
        
        // Building the Request object
        let urlString =  baseUrl + path
        var items = [URLQueryItem]()
        var urlComponents = URLComponents(string: urlString)
        
        for (key,value) in queryParamertes {
            items.append(URLQueryItem(name: key, value: value))
        }
        items.append(URLQueryItem(name: "access_key", value: appId))
        
        urlComponents?.queryItems = items
        
        guard let finalUrl = urlComponents?.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: finalUrl)
        urlRequest.httpMethod = httpRequestType.rawValue
        
        return urlRequest
    }
}
