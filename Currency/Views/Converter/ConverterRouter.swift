//
//  ConverterRouter.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation
import UIKit

protocol ConverterRouter: Router {

    static func routeToConverter(
        from context: UIViewController,
        fromCurrency: String,
        toCurrency: String
    )
}

extension ConverterRouter {

    static func routeToConverter(
        from context: UIViewController,
        fromCurrency: String,
        toCurrency: String
    ) {

        let controller = ConverterViewController.instantiate()
        controller.viewModel = ConverterViewModel(
            fromCurrency: fromCurrency,
            toCurrency: toCurrency
        )
        present(controller, from: context, animated: true)
    }
}

extension AppRouter: ConverterRouter {}
