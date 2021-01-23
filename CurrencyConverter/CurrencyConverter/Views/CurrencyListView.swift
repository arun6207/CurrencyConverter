//
//  CurrencyListView.swift
//  CurrencyConverter
//
//  Created by Arun Amuri on 23/01/2021.
//

import SwiftUI

struct CurrencyListView: View {
    
    @Binding var selectedCurrencyCode: String
    @ObservedObject var viewModel = CurrencyListViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.currencies.sorted(by: >), id: \.key) { key, value in
                    Text(value)
                        .onTapGesture {
                            selectedCurrencyCode = key
                            presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .onAppear {
                viewModel.getCurrencyOptions()
            }
        }
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    @State static var code = "USD"
    static var previews: some View {
        CurrencyListView(selectedCurrencyCode: $code)
    }
}
