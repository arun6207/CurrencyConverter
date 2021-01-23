//
//  CurrencyListViewModel.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import Foundation
import SwiftUI
import Combine

class CurrencyListViewModel: ObservableObject, CCService {
    
    var apiSession: APIService
    
    var cancellables = Set<AnyCancellable>()
    @Published var currencies = [String: String]()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
}

extension CurrencyListViewModel {
    func getCurrencyOptions() {
        let cancellable = getCurrencyLists()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (result) in
                if let currencies = result.currencies {
                    self.currencies = currencies
                }
            }
        cancellables.insert(cancellable)
    }
}
