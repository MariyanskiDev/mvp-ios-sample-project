//
//  Post.swift
//  mvp-ios-template-project
//
//  Created by Fotev Marian on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
