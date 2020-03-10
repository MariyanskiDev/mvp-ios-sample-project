//
//  UICollectionView+Ext.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 07/10/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(byType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Cannot type cast cell to \(String(describing: T.self)) type")
        }
        
        return cell
    }
    
    func registerCell<T: UICollectionViewCell>(byType: T.Type) {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellWithReuseIdentifier: String(describing: T.self))
    }
}
