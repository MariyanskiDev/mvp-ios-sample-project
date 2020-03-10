//
//  ViewModel.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 23/09/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
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
