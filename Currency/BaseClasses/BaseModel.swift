//
//  BaseModel.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation

protocol BaseModel: Codable {

    var error: ErrorModel? { get }
}
