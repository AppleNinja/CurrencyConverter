//
//  CurrenciesRouter.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation
import UIKit

protocol CurrenciesRouter: Router {

    static func routeToCurrenciesList(
        from context: UIViewController,
        delegate: CurrenciesDelegate
    )
}

extension CurrenciesRouter {

    static func routeToCurrenciesList(
        from context: UIViewController,
        delegate: CurrenciesDelegate
    ) {

        let controller = CurrenciesViewController.instantiate()
        controller.delegate = delegate
        present(controller, from: context, animated: true)
    }
}

extension AppRouter: CurrenciesRouter {}
