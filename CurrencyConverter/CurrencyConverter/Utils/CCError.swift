//
//  CCError.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import Foundation

enum CCError: String, Error {
    case invalidURL = "Invalid url"
    case invalidResponse = "Invalid response"
    case decodeError = "Decode error"
    case pageNotFound = "Requested page not found!"
    case noNetwork = "Internet connection not available!"
    case noData = "Oops! There are no matches for entered text."
    case unknownError = "Unknown error"
    case serverError = "Internal server error"
    case conversionIssue = "Oops! Getting some conversion issue."
    
    static func checkErrorCode(_ errorCode: Int = 0) -> CCError {
        switch errorCode {
        case 400:
            return .invalidURL
        case 500:
            return .serverError
        case 404:
            return .pageNotFound
        default:
            return .unknownError
        }
    }
}
