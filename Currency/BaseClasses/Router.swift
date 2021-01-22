//
//  Router.swift
//  Currency
//
//  Created by Sreekumar K on 22/01/2021.
//

import Foundation
import UIKit

/// Base presentation protocol
public protocol Router {

    static func push(
        _ controller: UIViewController,
        from context: UIViewController, animated: Bool
    )

    static func present(
        _ controller: UIViewController,
        from context: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    )
}

extension Router {

    static func push(
        _ controller: UIViewController,
        from context: UIViewController,
        animated: Bool = true
    ) {

        context.navigationController?.pushViewController(controller, animated: animated)
    }

    static func present(
        _ controller: UIViewController,
        from context: UIViewController,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        context.present(controller, animated: animated, completion: completion)
    }
}

public protocol BackRouter {

    static func routeToBack(from context: UIViewController, animated: Bool, completion: (() -> Void)?)
}

public extension BackRouter {

    static func routeToBack(from context: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {

        if context.isModal() {

            context.dismiss(animated: animated, completion: completion)
        } else {

            context.navigationController?.popViewController(animated: animated)
        }
    }
}
