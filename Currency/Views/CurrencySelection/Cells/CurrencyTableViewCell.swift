//
//  CurrencyTableViewCell.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation
import UIKit

struct CurrencyCellPresentation: Presentation {

    let country: String
    let currency: String
}

class CurrencyTableViewCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var currencyCodeLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!

    var presentation: CurrencyCellPresentation? {
        didSet {
            updateUI()
        }
    }

    func updateUI() {

        currencyCodeLabel.text = presentation?.currency
        countryCodeLabel.text = presentation?.country
    }
}
