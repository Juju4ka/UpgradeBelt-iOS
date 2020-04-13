//
//  FirstViewController.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 11/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data model: These strings will be the data for the table view cells
    let sections: [String] = ["Colour Belt Syllabus", "Black Belt Syllabus"]
    let colorBeltThumbnails: [String] = ["white-belt.png", "yellow-tag.png", "yellow-belt.png", "green-tag.png", "green-belt.png", "blue-tag.png", "blue-belt.png", "red-tag.png", "red-belt.png", "black-tag.png"]
    let blackBeltThumbnails: [String] = ["black-belt-1.png", "black-belt-2.png", "black-belt-3.png", "black-belt-4.png"]
    var thumbnails: [[String]] = []
    var tableData:[[UBGradingItem]] = []
   
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"

    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add thumbnails
        self.thumbnails.append(self.colorBeltThumbnails);
        self.thumbnails.append(self.blackBeltThumbnails);
        
        // load data from json to display in table view
        let gradingMaterial = UBDataStore().gradingMaterial

        self.tableData.append((gradingMaterial?.colorBelts)!)
        self.tableData.append((gradingMaterial?.blackBelts)!)
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()

        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of sections in table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    // set height for header in section in table view
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData[section].count
    }
        
    // create a view for header for each section in table view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width, height: 30))
        label.text = self.sections[section]
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 125/255.0, green: 158/255.0, blue: 121/255.0, alpha: 1.0)
        
        return view
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!

        // set the text from the data model
        let gradingItems = self.tableData[indexPath.section]
        let gradingItem = gradingItems[indexPath.row] as UBGradingItem
        cell.textLabel?.text = gradingItem.grade
        cell.imageView?.image = UIImage(named: self.thumbnails[indexPath.section][indexPath.row])

        return cell
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

