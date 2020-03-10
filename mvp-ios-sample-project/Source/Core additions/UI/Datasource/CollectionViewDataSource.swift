//
//  CollectionViewDataSource.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

final class CollectionViewDataSource: NSObject {
    
    var sections: [CollectionSectionModel] = []
}

// MARK: - UICollectionViewDataSource implementation

extension CollectionViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = sections[optional: section]?.items.count else {
            return 0
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let section = sections[optional: indexPath.section],
            let item = section.items[optional: indexPath.row] else { return UICollectionViewCell() }
        
        return item.cell(collectionView: collectionView, for: indexPath)
    }
}
