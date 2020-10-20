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

class TerminologyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var selectedBelt: UBGradingItem?
    var terminologyList: [UBTerminologyItem] = []
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "terminologyCell"
    
    var tableViewHeight: CGFloat = 0
    var viewAppeared: Bool = false
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var containerView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Terminology"
        
        self.terminologyList = self.selectedBelt?.terminology ?? []
        
        let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 0.8)
        self.backgroundView.backgroundColor = lightGreenColor
        
        self.containerView.backgroundColor = .clear
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.masksToBounds = true
        
        // Table View setups

        self.tableView.backgroundColor = .white        
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
        
        self.tableView.frame = CGRect(x: self.tableView.frame.origin.x, y: 0, width: self.tableView.frame.size.width, height: height)
    }
    
    // TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.terminologyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as! TerminologyTableViewCell
        cell.backgroundColor = .clear
        
        let terminology = self.terminologyList[indexPath.row]
                
        cell.englishLabel.text = terminology.english!
        cell.koreanLabel.text = terminology.korean!

        return cell
    }
    
}
