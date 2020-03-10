//
//  UITableView+Ext.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 10/09/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
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
