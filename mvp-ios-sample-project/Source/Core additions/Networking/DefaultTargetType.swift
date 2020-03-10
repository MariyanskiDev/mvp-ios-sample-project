//
//  DefaultTargetType.swift
//  mvp-ios-template-project
//
//  Created by Marian Fotev on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import Moya
import Foundation

/// The protocol used to define the specifications necessary for a `MoyaProvider`.
protocol DefaultTargetType: TargetType {
    
    /// API Version
    var version: String { get }

    /// Request parameters
    var parameters: [String: Any] { get }
    
    
    var encodingType: EncodingType { get }
}

enum EncodingType {
    case body
    case url
}

// MARK: - Default implementation for default target type

extension DefaultTargetType {
    
    var version: String {
        return ""
    }
    
    var encodingType: EncodingType {
        return .url
    }
}

// MARK: - Default implementation for target type

extension DefaultTargetType {
    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com\(version)")!
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
            case .body:
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
