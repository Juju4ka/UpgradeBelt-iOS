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
    let sections: [String] = ["Colour Belts", "Black Belts"]
    
    var tableData:[[UBGradingItem]] = []
    var lastY: CGFloat = 0.0
   
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"

    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()        
        
        self.title = "Belt Syllabus"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Belts", style: .plain, target: nil, action: nil)
        
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
        
        // no lines where there aren't cells
        self.tableView.tableFooterView = UIView(frame: .zero)        
        
        let gradientView = GradientBackgroundView()
        self.tableView.backgroundView = gradientView
        
//        let backgroundImage = UIImage.init(named: "background")
//        let imageView = UIImageView(image: backgroundImage)
//        imageView.contentMode = .scaleAspectFill
//        self.tableView.backgroundView = imageView
        
         tableView.bounces = false
        
////        // Add a background view to the table view
//       let backgroundImage = UIImage(named: "background.png")
//       let imageView = UIImageView(image: backgroundImage)
//
//        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: self.tableView.frame.height))
//        bgView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2)
//        imageView.addSubview(bgView)
//
//       self.tableView.backgroundView = imageView

        
       // center and scale background image
//       imageView.contentMode = .scaleAspectFit
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
//        Family: Book Antiqua Font names: ["BookAntiqua-BoldItalic", "BookAntiqua-Bold", "BookAntiqua-Italic", "BookAntiqua"]
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentY = scrollView.contentOffset.y
        let currentBottomY = scrollView.frame.size.height + currentY
        if currentY > lastY {
            //"scrolling down"
            tableView.bounces = true
        } else {
            //"scrolling up"
            // Check that we are not in bottom bounce
            if currentBottomY < scrollView.contentSize.height + scrollView.contentInset.bottom {
                tableView.bounces = false
            }
        }
        lastY = scrollView.contentOffset.y
    }
    
    // make the table view cells totally transparent
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
//        cell.contentView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
    }
    
    // number of sections in table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
//    // set height for header in section in table view
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData[section].count
    }
        
//    // create a view for header for each section in table view
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
//
////        let backgroundView = GradientBackgroundView()
////        view.addSubview(backgroundView)
//
//        let label = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width, height: 30))
//        label.text = self.sections[section]
//        label.font = UIFont(name: "BookAntiqua", size: 23)
//        view.addSubview(label)
//
////        view.backgroundColor = .lightGray
//
//        view.backgroundColor = UIColor(red: 189/255.0, green: 234/255.0, blue: 167/255.0, alpha: 1.0)
////        view.backgroundColor = .clear
//
//        return view
//    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        
        // set the text from the data model
        let gradingItems = self.tableData[indexPath.section]
        let gradingItem = gradingItems[indexPath.row] as UBGradingItem
        
        cell.textLabel?.text = gradingItem.grade
//        cell.textLabel?.font = UIFont(name: "BookAntiqua", size: 20)
        
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 152, height: 35)
        cell.imageView?.image = UIImage(named: gradingItem.iconName)
        cell.imageView?.contentMode = .scaleAspectFit
        
        return cell
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueFromTableBelts", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        //print("You tapped cell number \(indexPath.row).")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GradingMaterialViewController
        {
            let indexPath = tableView.indexPathForSelectedRow
            if (indexPath != nil) {
                let gradingItems = self.tableData[indexPath!.section]
                let gradingItem = gradingItems[indexPath!.row] as UBGradingItem
                let vc = segue.destination as? GradingMaterialViewController
                vc?.selectedBelt = gradingItem
            }
        }
    }
}

