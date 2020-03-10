//
//  ModalTransition.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 27/08/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
//

import UIKit

/// Переход используется когда нужно показать модально
/// на весь экран
final class ModalTransition: NSObject {
    
    // MARK: Dependencies
    
    var animator: Animator?
    var isAnimated: Bool = true
    
    var modalTransitionStyle: UIModalTransitionStyle
    var modalPresentationStyle: UIModalPresentationStyle
    
    // MARK: Public properties
    
    var completionHandler: (() -> Void)?
    weak var viewController: UIViewController?
    
    // MARK: Constructor
    
    init(animator: Animator? = nil,
         isAnimated: Bool = true,
         modalTransitionStyle: UIModalTransitionStyle = .coverVertical,
         modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        self.animator = animator
        self.isAnimated = isAnimated
        self.modalTransitionStyle = modalTransitionStyle
        self.modalPresentationStyle = modalPresentationStyle
    }
}

// MARK: - Transition implementation

extension ModalTransition: Transition {
    
    func open(_ viewController: UIViewController) {
        viewController.transitioningDelegate = self
        viewController.modalTransitionStyle = modalTransitionStyle
        viewController.modalPresentationStyle = modalPresentationStyle
        
        self.viewController?.present(viewController, animated: isAnimated, completion: completionHandler)
    }
    
    func close(_ viewController: UIViewController) {
        viewController.dismiss(animated: isAnimated, completion: completionHandler)
    }
}

// MARK: - UIViewControllerTransitioningDelegate implementation

extension ModalTransition: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else { return nil }
        
        animator.isPresenting = true
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else { return nil }
        
        animator.isPresenting = false
        return animator
    }
}
