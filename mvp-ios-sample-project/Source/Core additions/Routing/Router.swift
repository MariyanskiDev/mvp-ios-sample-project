//
//  Router.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 27/08/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
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
