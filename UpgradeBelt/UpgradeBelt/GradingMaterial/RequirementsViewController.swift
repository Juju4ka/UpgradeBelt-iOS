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
    @IBOutlet var tableHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Requirements"
        
        self.requirements = selectedBelt?.requirements ?? []
        
        let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 0.8)
        self.backgroundView.backgroundColor = lightGreenColor
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        self.tableView.backgroundColor = .white
        
        self.tableView.layer.cornerRadius = 10
        self.tableView.layer.masksToBounds = true
        self.tableView.allowsSelection = false
        
        // no lines where there aren't cells
        self.tableView.tableFooterView = UIView(frame: .zero)

        self.tableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        self.tableView.reloadData()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if (self.tableView.contentSize.height < self.tableView.frame.size.height) {
            self.tableView.isScrollEnabled = false
        } else {
            self.tableView.isScrollEnabled = true
        }
        
        tableHeightConstraint.constant = self.tableView.contentSize.height + 50
        self.tableView.layoutIfNeeded()
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
        
        let image = UIImage(named: "list")
        cell.imageView?.image = image
        cell.imageView?.contentMode = .scaleAspectFit
        
        cell.textLabel?.text = requirement.name
        cell.textLabel?.numberOfLines = 0
        
        cell.backgroundColor = .clear
//        cell.separatorInset = UIEdgeInsets(top: 2, left: cell.separatorInset.left, bottom: 0, right: 0)
        
        return cell
    }
    
}
