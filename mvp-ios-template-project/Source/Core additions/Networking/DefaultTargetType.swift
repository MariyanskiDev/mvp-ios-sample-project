//
//  DefaultTargetType.swift
//  mvp-ios-template-project
//
//  Created by Marian Fotev on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import Moya
import Foundation

/// Протокол, используемый для определения спецификаций,
/// необходимых для `MoyaProvider`
protocol DefaultTargetType: TargetType {
    
    /// Версия API
    var version: String { get }

    /// Параметры запроса
    var parameters: [String: Any] { get }
    
    /// Способ кодирования параметров
    var encodingType: EncodingType { get }
}

/// Перечисление способов кодирования параметров
///
/// - json: JSONEncoding() для кодирования в json
/// - url: URLEncoding() для кодирования как атрибуты URL
/// - propertyList: PropertyListEncoding() для кодирования в список параметров
enum EncodingType {
    case json
    case url
}

// MARK: - Default implementation for default target type

extension DefaultTargetType {
    
    var version: String {
        return "api"
    }
    
    var encodingType: EncodingType {
        return .json
    }
}

// MARK: - Default implementation for target type

extension DefaultTargetType {
    
    var baseURL: URL {
        return URL(string: "https://something\(version)/")!
    }
    
    var sampleData: Data {
        let fileName = path.replacingOccurrences(of: "/", with: "_")
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json", subdirectory: "json") else {
            assertionFailure("There is no file named \(fileName).json at path")
            return Data()
        }
        
        do {
            return try Data(contentsOf: url)
        } catch {
            assertionFailure("Cannot initialize data from path: \(url.absoluteString)")
            return Data()
        }
    }
    
    var task: Task {
        let encoding: ParameterEncoding = {
            switch encodingType {
            case .json:
                return JSONEncoding()
            case .url:
                return URLEncoding()
            }
        }()
        
        return .requestParameters(parameters: parameters, encoding: encoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
