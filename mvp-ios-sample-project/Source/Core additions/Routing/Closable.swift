//
//  Closable.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 28/08/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
//

/// Протокол - абстракция для тех классов, которые
/// могут закрываться
protocol Closable: class {
    
    func close()
}
