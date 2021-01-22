//
//  ErrorResponse.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation

struct ErrorResponse: Codable {

    let code: Int?
    let info: String?
    let type: String?
}
