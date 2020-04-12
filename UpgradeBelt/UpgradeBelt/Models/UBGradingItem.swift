//
//  UBGradingItem.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 12/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation

struct UBGradingItem : Codable {
    let identifier: String
    let grade: String?
    let requirements: String?
    let gradingPatterns: [UBGradingPattern]?
    let terminology: [UBTerminologyItem]?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case grade = "grade"
        case requirements = "requirements"
        case gradingPatterns = "patterns"
        case terminology = "terminology"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.grade = try container.decode(String.self, forKey: .grade)
        self.requirements = try container.decode(String.self, forKey: .requirements)
        self.gradingPatterns = try container.decode([UBGradingPattern].self, forKey: .gradingPatterns)
        self.terminology = try container.decode([UBTerminologyItem].self, forKey: .terminology)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.grade, forKey: .grade)
        try container.encode(self.requirements, forKey: .requirements)
        try container.encode(self.gradingPatterns, forKey: .gradingPatterns)
        try container.encode(self.terminology, forKey: .terminology)
    }
}
