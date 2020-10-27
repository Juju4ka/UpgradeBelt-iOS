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
        
    @IBOutlet var backgroundView: UIView!    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Requirements"
        
        self.requirements = selectedBelt?.requirements ?? []
        
        let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 0.8)
        self.backgroundView.backgroundColor = lightGreenColor
        
        self.containerView.backgroundColor = .clear
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.masksToBounds = true
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        
        if (self.traitCollection.userInterfaceStyle == .dark) {
            // User Interface is Dark
            self.tableView.backgroundColor = .gray
        } else {
            self.tableView.backgroundColor = .white
        }
        self.tableView.layer.cornerRadius = 10
        self.tableView.allowsSelection = false
        
        // no lines where there aren't cells
        self.tableView.tableFooterView = UIView(frame: .zero)

        self.tableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        self.tableView.reloadData()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        let contentHeight = self.tableView.contentSize.height
        
        let height = (contentHeight < self.containerView.frame.size.height) ? contentHeight : self.containerView.frame.size.height
        
        self.tableView.frame = CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.size.width, height: height)        
    }
    
    // TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requirements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        
        let requirement = self.requirements[indexPath.row]
        
        let image = UIImage(named: "list")
        cell.imageView?.image = image
        cell.imageView?.contentMode = .scaleAspectFit
        
        cell.textLabel?.text = requirement.name
        cell.textLabel?.font = .systemFont(ofSize: 15.0)
        cell.textLabel?.numberOfLines = 0
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
}
