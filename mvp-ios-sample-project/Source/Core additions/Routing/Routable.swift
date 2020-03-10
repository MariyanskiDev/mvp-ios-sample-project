//
//  Routable.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 28/08/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
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
