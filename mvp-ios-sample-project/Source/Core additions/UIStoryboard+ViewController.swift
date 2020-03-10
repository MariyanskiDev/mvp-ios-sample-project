//
//  UIViewController+Create.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 29/08/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func viewController<T>() -> T {
        let viewControllerName = String(describing: T.self)
        let storyboardName = viewControllerName.replacingOccurrences(of: "ViewController", with: "")
        
        guard let view = UIStoryboard(
            name: storyboardName,
            bundle: Bundle.main).instantiateInitialViewController() as? T else {
                fatalError("Can't load \(viewControllerName) from \(storyboardName).storyboard, check that controller is initial view controller")
        }
        
        return view
    }
}
