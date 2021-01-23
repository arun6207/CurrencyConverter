//
//  CurrencyList.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import Foundation

struct ListResponse: Codable {
    var success: Bool
    
    // success: true
    var terms: URL?
    var privacy: URL?
    var currencies: [String: String]?
    // success: false
    var error: CLError?
}
