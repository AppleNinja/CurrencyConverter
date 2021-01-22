//
//  LatestRatesViewModel.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation
import Alamofire

struct LatestRatesState {

    enum Change: StateChange {

        case loading
        case loaded
        case failed(error: String)
    }

    var baseCurrency: String = "EUR"
    var rates: [String: Double] = [:]
}

class LatestRatesViewModel: StatefulViewModel<LatestRatesState.Change> {

    var state = LatestRatesState()

    func setBaseCurrency(_ base: String) {

        state.baseCurrency = base
        loadLatestRates()
    }

    func loadLatestRates() {

        trigger(change: .loading)
        APIClient.performRequest(
            route: .latest,
            params: ["base": state.baseCurrency]) { [weak self] (result: Result<LatestRatesResponse, Error>) in

                guard let self = self else { return }
                switch result {
                case .success(let rates):
                    self.state.rates = rates.rates ?? [:]
                    if self.state.rates.isEmpty {
                        self.trigger(change: .failed(error: "Something went wrong! Try again later"))
                        return
                    }
                    self.trigger(change: .loaded)
                case .failure(let error):
                    self.trigger(change: .failed(error: error.localizedDescription))
                }
        }
    }
}
