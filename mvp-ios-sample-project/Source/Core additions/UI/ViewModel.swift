//
//  ViewModel.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

protocol ViewModel {
    
    func view() -> UIView
}

extension UIView {
    
    static func fromNib<T: UIView>() -> T {
        let nibName = String(describing: T.self)
        
        guard let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?[0] as? T else {
            fatalError()
        }
        
        return view
    }
}
