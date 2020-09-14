//
//  TerminologyViewController.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 11/09/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation
import UIKit

import CoreGraphics

class TerminologyViewController: UIViewController {
    
    var selectedBelt: UBGradingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Terminology"
        
        let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 1.0)
        self.view.backgroundColor = lightGreenColor
    }
}
