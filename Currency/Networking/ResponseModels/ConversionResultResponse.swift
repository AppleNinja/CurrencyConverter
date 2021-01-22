//
//  ConversionResultResponse.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation

struct ConversionResultResponse: BaseModel {

    let result: Double?
    let error: ErrorResponse?
}
