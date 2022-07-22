//
//  UBGradingRequirement.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 14/09/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation

// An object that describes what students need to learn to reach a particular grade
struct UBGradingRequirement : Codable {
    let identifier: String // An identifier
    let name: String? // The name of the requirement
    let patternId: String? // An identifier of an object of the pattern associated the requirement
    let description: String? // A description of the requirement
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case patternId = "patternId"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.patternId = try container.decodeIfPresent(String.self, forKey: .patternId)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.patternId, forKey: .patternId)
        try container.encode(self.description, forKey: .description)
    }
}
