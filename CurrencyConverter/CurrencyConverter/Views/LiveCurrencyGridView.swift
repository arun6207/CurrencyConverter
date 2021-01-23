//
//  LiveCurrencyGridView.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import SwiftUI

struct LiveCurrencyGridView: View {
    
    @ObservedObject var currencies: CurrencyLiveViewModel
    @Binding var currencyCode: String
    @Binding var amount: String
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(currencies.quotes.sorted(by: <), id: \.key) { key, value in
                    VStack {
                        Text(key.replacingOccurrences(of: "USD", with: ""))
                        Text("$\(exchangeCurrency(for: amount.doubledValue, currency: value))")
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.gray)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
    }
    
    func exchangeCurrency(for amount: Double, currency exchange: Double) -> String {
        let value = amount * exchange
        return value.roundedToTwoDecimals
    }
}

extension Double {
    var roundedToTwoDecimals:String {
        return String(format: "%.2f", self)
    }
}

extension String {
    var doubledValue: Double {
       return Double(self) ?? 0.0
    }
}
