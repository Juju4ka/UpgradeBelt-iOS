//
//  UBDataStore.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 12/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation

class UBDataStore {
    
    @Published var gradingMaterial : UBGradingMaterial?
    
    init() {
        self.gradingMaterial = load()
    }
    
    func load() -> UBGradingMaterial? {
        // Get location of the file stored within the project bundle
        if let fileLocation = Bundle.main.url(forResource: "grading", withExtension: "json") {
            do {
                // Read the contents of the file
                let jsonData = try Data(contentsOf: fileLocation)
                
                //Initializes a UBGradingMaterial object from the JSON data
                let gradingMaterial = try! JSONDecoder().decode(UBGradingMaterial.self, from: jsonData)
                return gradingMaterial;
                
            } catch {
                print("Failed to decode JSON")
                print(error)
            }
        }
        
        return nil
    }
}
