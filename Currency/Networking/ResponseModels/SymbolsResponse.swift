//
//  SymbolsResponse.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation

struct SymbolsResponse: BaseModel {

    var symbols: [String: String]?
    var error: ErrorResponse?
}
