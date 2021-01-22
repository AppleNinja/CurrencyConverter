//
//  BundleDefinable.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation

/// Protocol to conform when bundle should be specified
public protocol BundleDefinable {

    static var bundle: Bundle { get }
}

extension BundleDefinable {

    public static var bundle: Bundle {
        return Bundle.main
    }
}
