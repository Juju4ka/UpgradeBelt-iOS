//
//  UBGradingPattern.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 12/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation

struct UBGradingPattern : Codable {
    let identifier: String
    let name: String?
    let movements: Int?
    let meaning: String?
    let videoLink: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case movements = "movements"
        case meaning = "meaning"
        case videoLink = "videoLink"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.name = try container.decode(String.self, forKey: .name)
        self.movements = try container.decode(Int.self, forKey: .movements)
        self.meaning = try container.decode(String.self, forKey: .meaning)
        self.videoLink = try container.decode(String.self, forKey: .videoLink)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.movements, forKey: .movements)
        try container.encode(self.meaning, forKey: .meaning)
        try container.encode(self.videoLink, forKey: .videoLink)
    }
}
