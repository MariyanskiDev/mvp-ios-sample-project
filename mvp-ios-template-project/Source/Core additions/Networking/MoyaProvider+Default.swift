//
//  MoyaProvider+Default.swift
//  mvp-ios-template-project
//
//  Created by Marian Fotev on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import Moya
import Foundation

extension MoyaProvider {
    
    static func `default`() -> MoyaProvider {
        var plugins: [PluginType] = []
        
        #if DEBUG
        let network = NetworkLoggerPlugin()
        plugins.append(network)
        #endif

        return MoyaProvider(plugins: plugins)
    }
}
