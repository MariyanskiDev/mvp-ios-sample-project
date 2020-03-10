//
//  Animator.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 27/08/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
//

import UIKit

/// Протокол - абстракция для кастомных переходов
protocol Animator: UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool { get set }
}
