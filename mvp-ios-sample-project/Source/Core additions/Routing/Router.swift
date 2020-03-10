//
//  Router.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

/// Базовый роутер
class Router<T> where T: UIViewController {
    typealias View = T
    
    weak var view: View?
    var openTransition: Transition?
}

// MARK: - Routable implementation

extension Router: Routable {
    
    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = view
        transition.open(viewController)
    }
}

// MARK: - Closable implementation

extension Router: Closable {
    
    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("You need to have an open transition to close view controller")
            return
        }
        guard let view = view else {
            assertionFailure("There is no view controller to close")
            return
        }
        openTransition.close(view)
    }
}
