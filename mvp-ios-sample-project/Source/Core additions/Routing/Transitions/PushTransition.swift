//
//  PushTransition.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 27/08/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
//

import UIKit

/// Используется когда нужно сделать пуш переход
final class PushTransition: NSObject {
    
    // MARK: Dependencies
    
    var animator: Animator?
    var isAnimated: Bool = true
    
    // MARK: Public properties
    
    var completionHandler: (() -> Void)?
    weak var viewController: UIViewController?
    
    // MARK: Constructor
    
    init(animator: Animator? = nil, isAnimated: Bool = true) {
        self.animator = animator
        self.isAnimated = isAnimated
    }
}

// MARK: - Transition implementation

extension PushTransition: Transition {
    
    func open(_ viewController: UIViewController) {
        self.viewController?.navigationController?.delegate = self
        self.viewController?.navigationController?.pushViewController(viewController, animated: isAnimated)
    }
    
    func close(_ viewController: UIViewController) {
        self.viewController?.navigationController?.popViewController(animated: isAnimated)
    }
}

// MARK: - UINavigationControllerDelegate implementation

extension PushTransition: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        completionHandler?()
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else { return nil }

        animator.isPresenting = operation == .push
        return animator
    }
}
