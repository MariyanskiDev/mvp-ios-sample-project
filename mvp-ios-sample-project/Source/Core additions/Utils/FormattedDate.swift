//
//  FormattedDate.swift
//  BusinessTravel
//
//  Created by Fotev Marian on 18/09/2019.
//  Copyright © 2019 Tekhnologii Delovogo Turizma, OOO. All rights reserved.
//

import Foundation

protocol FormattedDateType {
    static var dateFormatter: DateFormatter { get }
}

/// Структура - хелпер, для мапинга дат с разными
/// форматами внутри одной структуры
struct FormattedDate<E: FormattedDateType>: Codable, Equatable {
    
    let value: Date
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let text = try container.decode(String.self)
        guard let date = E.dateFormatter.date(from: text) else {
            throw DateFormatingError.general
        }
        self.value = date
    }
    
    init(from date: Date) {
        self.value = date
    }
    
    func encode(to encoder: Encoder) throws {
        var contrainer = encoder.singleValueContainer()
        let string = E.dateFormatter.string(from: value)
        
        try contrainer.encode(string)
    }
        
    enum DateFormatingError: Error {
        case general
    }
}
