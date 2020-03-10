//
//  UIViewController+Create.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
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
