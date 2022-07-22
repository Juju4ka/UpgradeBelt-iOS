//
//  UBGradingItem.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 12/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation

// An object that describes a grading item of grading material
struct UBGradingItem : Codable {
    let identifier: String // An identifier of a grading item
    let grade: String? // The name of the grade
    let requirements: [UBGradingRequirement]? // A list of requirements to preprare for grading
    let gradingPatterns: [UBGradingPattern]? // A list of patterns to learn for grading
    let terminology: [UBTerminologyItem]? // A list of terminology to know for grading
    let iconName: String // The name of the icon representing the grade
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case grade = "grade"
        case requirements = "requirements"
        case gradingPatterns = "patterns"
        case terminology = "terminology"
        case iconName = "iconName"
    }
    
    init?() {
        return nil
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.grade = try container.decode(String.self, forKey: .grade)
        self.requirements = try container.decode([UBGradingRequirement].self, forKey: .requirements)
        self.gradingPatterns = try container.decode([UBGradingPattern].self, forKey: .gradingPatterns)
        self.terminology = try container.decode([UBTerminologyItem].self, forKey: .terminology)
        self.iconName = try container.decode(String.self, forKey: .iconName)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.identifier, forKey: .identifier)
        try container.encode(self.grade, forKey: .grade)
        try container.encode(self.requirements, forKey: .requirements)
        try container.encode(self.gradingPatterns, forKey: .gradingPatterns)
        try container.encode(self.terminology, forKey: .terminology)
        try container.encode(self.iconName, forKey: .iconName)
    }
}
