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
    
    
    /// Базовый `MoyaProvider` с логированием запросов и плагином авторизации
    ///
    /// - Parameter tokenService: сервис для работы с токенами авторизации
    /// - Returns: provider
    static func `default`() -> MoyaProvider {
        var plugins: [PluginType] = []
        
        #if DEBUG
        let network = NetworkLoggerPlugin()
        plugins.append(network)
        #endif

        return MoyaProvider(plugins: plugins)
    }
}
