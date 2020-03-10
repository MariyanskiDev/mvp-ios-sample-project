//
//  UITableView+Ext.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(byType: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Cannot type cast cell to \(String(describing: T.self)) type")
        }
        
        return cell
    }
    
    func registerCell<T: UITableViewCell>(byType: T.Type) {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(byType: T.Type) {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }
}
