//
//  GradingMaterialViewController.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 16/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import UIKit

import CoreGraphics

class GradingMaterialViewController: UIViewController {
    
    let thumbnails: [String] = ["icon_requirements.png", "icon_patterns.png", "icon_terminology.png"]
    let tableData: [String] = ["Requirements", "Patterns", "Terminology"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Grading Material"
        
        let gradientView = GradientBackgroundView(frame: self.view.frame)
        self.view.addSubview(gradientView)
        
    }
    
}
