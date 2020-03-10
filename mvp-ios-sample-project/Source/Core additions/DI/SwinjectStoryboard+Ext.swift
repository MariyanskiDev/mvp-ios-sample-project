//
//  SwinjectStoryboard+Ext.swift
//  mvp-ios-sample-project
//
//  Created by Marian Fotev on 10/03/2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    @objc class func setup() {
        let services: [Assembly] = [PostsServiceAssembly()]
        
        let modules: [Assembly] = [PostsAssembly(), CommentsAssembly()]

        AppAssembly.defaultAssembler.apply(assemblies: services)
        AppAssembly.defaultAssembler.apply(assemblies: modules)
    }
}
