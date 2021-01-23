//
//  CurrencyLiveViewModel.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import Foundation
import Combine

class CurrencyLiveViewModel: ObservableObject, CCService {
    var apiSession: APIService
    @Published var quotes = [String: Double]()
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
}

extension CurrencyLiveViewModel {
    
    func getLiveCurrencyValues() {
        let cancellable = getCurrencyLive()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (result) in
                if let quotes = result.quotes {
                    self.quotes = quotes
                }
            }
        cancellables.insert(cancellable)
    }
}
