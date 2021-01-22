//
//  NibLoadable.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation
import UIKit

public protocol NibLoadable: class, BundleDefinable {

    /// The nib file to use to load a new instance of the View designed in an XIB
    static var nib: UINib { get }
}

public extension NibLoadable {

    /// By default, use the nib which have the same name as the name of class
    static var nib: UINib {

        return UINib(nibName: String(describing: self), bundle: bundle)
    }
}

public extension NibLoadable where Self: UIView {

    /// Returns a UIView object instantiated from nib
    ///
    /// - Returns: A `NibLoadable`, `UIView` instance
    static func instanceFromNib() -> Self {

        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }

        return view
    }
}

public extension NibLoadable where Self: UIViewController {

    /// Returns a UIViewController object instantiated from nib
    ///
    /// - Returns: A `UIViewController` instance
    static func instanceFromNib() -> Self {

        return self.init(nibName: String(describing: self), bundle: bundle)
    }
}
