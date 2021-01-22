//
//  LatestRatesResponse.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation

struct LatestRatesResponse: BaseModel {

    var base: String?
    var date: String?
    var rates: [String: Double]?
    var error: ErrorResponse?
}

