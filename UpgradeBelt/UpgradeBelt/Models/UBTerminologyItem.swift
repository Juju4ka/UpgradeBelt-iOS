//
//  UBTerminologyItem.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 12/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation

// An object that describes a vocabulary in grading material
struct UBTerminologyItem: Codable {
    let identifier: String // An identifier of the terminology item
    let english: String? // An English word for an object (for a punch, kick, action, etc.)
    let korean: String? // A Korean word for an object
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case english = "English"
        case korean = "Korean"
     }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.english = try container.decode(String.self, forKey: .english)
        self.korean = try container.decode(String.self, forKey: .korean)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.english, forKey: .english)
        try container.encode(self.korean, forKey: .korean)
    }   
}
