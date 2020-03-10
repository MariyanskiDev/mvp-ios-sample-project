//
//  Transition.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

/// Абстракция - протокол для переходов
protocol Transition: class {
    
    /// ViewController из которого будет происходить переход
    ///
    /// - Attention: должна быть слабая ссылка на него
    var viewController: UIViewController? { get set }
    
    /// Открывает
    ///
    /// - Parameter viewController: view controller который будет открыт
    func open(_ viewController: UIViewController)
    
    /// Закрывает
    ///
    /// - Parameter viewController: view controller который будет закрыт
    func close(_ viewController: UIViewController)
}
