//
//  Episode.swift
//  LearnUIKit
//
//  Created by Duc Do on 24/05/2023.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
