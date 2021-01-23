//
//  CurrencyLiveView.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import SwiftUI

struct CurrencyLiveView: View {
    @ObservedObject var viewModel = CurrencyLiveViewModel()
    @State var showCurrencyList = false
    @State private var amount: String = ""
    @State private var selectedCurrencyCode = "USD"
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter amount in USD", text: $amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                Button(selectedCurrencyCode) {
                    showCurrencyList.toggle()
                }
                .buttonStyle(FilledButton())
                LiveCurrencyGridView(currencies: viewModel,
                                     currencyCode: $selectedCurrencyCode,
                                     amount: $amount)
                Spacer()
            }.padding()
            .navigationBarTitle("Currency Converter")
        }
        .sheet(isPresented: $showCurrencyList) {
            CurrencyListView(selectedCurrencyCode: $selectedCurrencyCode)
        }
        .onAppear {
            viewModel.getLiveCurrencyValues()
        }
    }
    
}

struct CurrencyLiveView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyLiveView()
    }
}
