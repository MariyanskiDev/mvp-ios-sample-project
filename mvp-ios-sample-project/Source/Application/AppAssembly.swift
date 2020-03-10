//
//  AppAssembly.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class AppAssembly {
    
    static let defaultAssembler: Assembler = {
        let assembler = Assembler(container: SwinjectStoryboard.defaultContainer)
        
        #if RELEASE
        Container.loggingFunction = nil
        #endif
        
        return assembler
    }()
    
    static let resolver = defaultAssembler.resolver
}
