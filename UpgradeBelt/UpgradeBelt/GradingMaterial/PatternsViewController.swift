//
//  PatternsViewController.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 11/09/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation
import UIKit

import CoreGraphics

class PatternsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var selectedBelt: UBGradingItem?
    
    // cell reuse id (cells that scroll out of view can be reused)
    private let cellReuseIdentifier = "cell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Patterns"
        
        let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 1.0)
        self.view.backgroundColor = lightGreenColor
        
//        // Register the table view cell class and its reuse id
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // no lines where there aren't cells
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
        
        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        let gradingPattern = self.selectedBelt?.gradingPatterns![indexPath.row]
//
//        var cellHeight = 100
//
//        if (!(gradingPattern?.meaning?.isEmpty ?? false)) {
//            cellHeight = 250
//        }
//
//        return CGFloat(cellHeight)
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.selectedBelt?.gradingPatterns?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "patternCell")! as! PatternTableViewCell
        let gradingPattern = self.selectedBelt?.gradingPatterns![indexPath.row]
        
        cell.customBackgroundView?.layer.cornerRadius = 8
        cell.customBackgroundView?.backgroundColor = .white
        
        cell.titleLabel?.numberOfLines = 0
        cell.titleLabel?.text = gradingPattern?.name
        cell.titleLabel?.sizeToFit()
        
        cell.smallDescriptionLabel?.numberOfLines = 0
        cell.smallDescriptionLabel?.text = "Movements - " + String(gradingPattern?.movements ?? 0)
        cell.smallDescriptionLabel?.sizeToFit()
        
        cell.descriptionLabel?.numberOfLines = 0
        cell.descriptionLabel?.text = gradingPattern?.meaning
        cell.descriptionLabel.sizeToFit()
        
        
//        let cellWidth = self.view.frame.size.width - 40
//        var cellHeight = 90
//
//        if (!(gradingPattern?.meaning?.isEmpty ?? false)) {
//            cellHeight = 240
//        }
//
//        let view = UIView(frame: CGRect(x: 20, y: 10, width: Int(cellWidth), height: cellHeight))
//        view.backgroundColor = .white
//        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor.white.cgColor
//        view.layer.cornerRadius = 8
//        cell.addSubview(view)
//
//        // Name of the pattern
//        let nameLabel = UILabel(frame: CGRect(x: 20, y: 20, width: cellWidth, height: 20))
//        nameLabel.text = gradingPattern?.name
//        nameLabel.font = UIFont.systemFont(ofSize: 17.0)
//        view.addSubview(nameLabel)
//
//        // Number of Movements in pattern
//        let movementsLabel = UILabel(frame: CGRect(x: 20, y: 55, width: cellWidth, height: 20))
//        movementsLabel.text = "Movements: " + String(gradingPattern?.movements ?? 0)
//        movementsLabel.font = UIFont.systemFont(ofSize: 14.0)
//        view.addSubview(movementsLabel)
//
//        if (!(gradingPattern?.meaning?.isEmpty ?? false)) {
//            // Meaning of the pattern
//            let meaningTextView = UITextView(frame: CGRect(x: 20, y: 80, width: cellWidth - 40, height: 140))
//            meaningTextView.text = gradingPattern?.meaning
//            meaningTextView.font = UIFont.systemFont(ofSize: 14.0)
//            meaningTextView.isEditable = false
//            view.addSubview(meaningTextView)
//
//
//            let sizeThatFitsTextView = meaningTextView.sizeThatFits(CGSize(width: meaningTextView.frame.size.width, height: CGFloat(MAXFLOAT)))
//            let heightOfText = sizeThatFitsTextView.height
//
//            print(heightOfText)
//
//        }
        
        return cell
    }
}
