//
//  CurrenciesViewModel.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation
import Alamofire

struct CurrenciesState {

    enum Change: StateChange {

        case loading
        case loaded
        case failed(error: String)
    }

    var currencies: [String: String] = [:]
}

class CurrenciesViewModel: StatefulViewModel<CurrenciesState.Change> {

    var state = CurrenciesState()

    func loadCurrencies() {

        trigger(change: .loading)
        APIClient.performRequest(
            route: .symbols
        ) { [weak self] (result: Result<SymbolsResponse, Error>) in

                guard let self = self else { return }
                switch result {
                case .success(let symbols):
                    self.state.currencies = symbols.symbols ?? [:]
                    self.trigger(change: .loaded)
                case .failure(let error):
                    self.trigger(change: .failed(error: error.localizedDescription))
                }
        }
    }
}
