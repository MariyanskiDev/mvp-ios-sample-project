//
//  Transition.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 27/08/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
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
