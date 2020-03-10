//
//  Routable.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

/// Протокол - абстракция для тех `UIViewController`,
/// которые могут делать переход на другие экраны
protocol Routable: class {
    associatedtype View: UIViewController
    
    var view: View? { get }
    
    /// Открывает viewcontroller
    ///
    /// - Parameters:
    ///   - viewController: на который будет сделан переход
    ///   - transition: переход
    func open(_ viewController: UIViewController, transition: Transition)
}
