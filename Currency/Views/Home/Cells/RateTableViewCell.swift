//
//  RateTableViewCell.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation
import UIKit

struct RateCellPresentation: Presentation {

    let currencyCode: String
    let rate: String
}

class RateTableViewCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var currencyCodeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!

    var presentation: RateCellPresentation? {
        didSet {
            updateUI()
        }
    }

    func updateUI() {

        currencyCodeLabel.text = presentation?.currencyCode
        rateLabel.text = presentation?.rate
    }
}
