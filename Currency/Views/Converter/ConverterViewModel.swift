//
//  ConverterViewModel.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation

struct ConverterState {

    enum Change: StateChange {

        case loading
        case loaded
        case failed(error: String)
    }

    var fromCurrency: String
    var toCurrency: String
    var convertedAmount: Double = 0.0
}

class ConverterViewModel: StatefulViewModel<ConverterState.Change> {

    var state: ConverterState

    init(fromCurrency: String, toCurrency: String) {

        state = ConverterState(fromCurrency: fromCurrency, toCurrency: toCurrency)
    }

    func convertAmount(_ amount: String) {

        trigger(change: .loading)
        APIClient.performRequest(
            route: .convert,
            params: [
                "from": state.fromCurrency,
                "to": state.toCurrency,
                "amount": amount
            ]
            ) { [weak self] (result: Result<ConversionResultResponse, Error>) in

                guard let self = self else { return }
                switch result {
                case .success(let result):
                    self.state.convertedAmount
                        = result.result ?? 0.0
                    print(result)
                    self.trigger(change: .loaded)
                case .failure(let error):
                    self.trigger(change: .failed(error: error.localizedDescription))
                }
        }
    }
}
