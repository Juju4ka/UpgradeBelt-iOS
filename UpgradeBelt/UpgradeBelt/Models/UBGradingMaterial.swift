//
//  UBGradingMaterial.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 12/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation

struct UBGradingMaterial : Codable {
    let identifier: String
    let colorBelts: [UBGradingItem]?
    let blackBelts: [UBGradingItem]?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case colorBelts = "colorBelts"
        case blackBelts = "blackBelts"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.colorBelts = try container.decode([UBGradingItem].self, forKey: .colorBelts)
        self.blackBelts = try container.decode([UBGradingItem].self, forKey: .blackBelts)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.colorBelts, forKey: .colorBelts)
        try container.encode(self.blackBelts, forKey: .blackBelts)
    }
}
