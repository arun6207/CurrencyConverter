//
//  CurrencyLive.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import Foundation

struct LiveResponse: Codable {
    var success: Bool
    
    // success: true
    var terms: URL?
    var privacy: URL?
    var timestamp: Int?
    var source: String?
    var quotes: [String: Double]?
    
    // success: false
    var error: CLError?
}
