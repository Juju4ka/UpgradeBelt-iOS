//
//  RequirementsViewController.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 11/09/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation
import UIKit

import CoreGraphics

class RequirementsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedBelt: UBGradingItem?
    var requirements: [UBGradingRequirement] = []
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Requirements"
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        
        let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 0.5)
        
        self.backgroundView.backgroundColor = lightGreenColor
        self.tableView.backgroundColor = .clear
     
        self.requirements = selectedBelt?.requirements ?? []
        
//        let chars: Set<Character> = ["\t"]
//        var text = selectedBelt?.requirements ?? ""
//        text.removeAll(where: { chars.contains($0) })
//
//        self.requirements = text.components(separatedBy: "\n")
        
        self.tableView.reloadData()
        
    }
    
    // TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requirements.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        
        let requirement = self.requirements[indexPath.row]
        cell.textLabel?.text = requirement.name
        cell.textLabel?.numberOfLines = 2
        return cell
    }
    
}
