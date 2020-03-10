//
//  Closable.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

/// Протокол - абстракция для тех классов, которые
/// могут закрываться
protocol Closable: class {
    
    func close()
}
