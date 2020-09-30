//
//  GradingMaterialViewController.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 16/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import UIKit

import CoreGraphics

class GradingMaterialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let thumbnails: [String] = ["requirements", "patterns", "terminology"]
    let gradingSections: [String] = ["Requirements", "Patterns", "Terminology"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    var selectedBelt: UBGradingItem?

    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Grading Material"
        
//        let gradientView = GradientBackgroundView(frame: self.view.frame)
//        self.view.addSubview(gradientView)
        
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
        tableView.isScrollEnabled = false
        
        configureTableHeaderView()
    }
    
    func configureTableHeaderView() {
        
        let basicHeight = 115
        let basicH = 667
        let height = (basicHeight * Int(self.view.frame.size.height)) / basicH
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.size.width), height: height))
        tableView.tableHeaderView = headerView
    }
    
     // make the table view cells totally transparent
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.backgroundColor = .clear
    //        cell.contentView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        }
        
        // number of sections in table view
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        // set height for header in section in table view
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 70
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 75
        }

        // number of rows in table view
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.gradingSections.count
        }
            
        // create a view for header for each section in table view
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 70))
            
            let label = UILabel(frame: CGRect(x: 30, y: 22, width: tableView.frame.size.width, height: 35))
            label.text = selectedBelt?.grade
//            label.font = UIFont(name: "BookAntiqua", size: 23)
            label.font = UIFont.boldSystemFont(ofSize: 20)
            view.addSubview(label)
            
            let imageView = UIImageView(frame: CGRect(x: self.view.frame.size.width - 120, y: 22, width: 100, height: 35))
            imageView.contentMode = .scaleAspectFit
            let image = UIImage(named: selectedBelt!.iconName)
            imageView.image = image
            view.addSubview(imageView)
    
            return view
        }

        // create a cell for each table view row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            // create a new cell if needed or reuse an old one
            let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
            
//            let view = UIView(frame: CGRect(x: 20, y: 20, width: tableView.frame.size.width-40, height: 80))
//
//            cell.addSubview(view)
//
////            view.layer.cornerRadius = 10
////            view.backgroundColor = .lightGray
//
//            let imageView = UIImageView(frame: CGRect(x: 32, y: 10, width: 50, height: 50))
//            imageView.contentMode = .scaleAspectFit
//            let image = UIImage(named: self.thumbnails[indexPath.row])
//            imageView.image = image
//
//            view.addSubview(imageView)
//
//            let labelView = UILabel(frame: CGRect(x: 133, y: 20, width: cell.frame.size.width, height: 26))
//            labelView.text = self.gradingSections[indexPath.row]
//            labelView.font = UIFont(name: "BookAntiqua", size: 18)
//            view.addSubview(labelView)
//
            
            cell.textLabel?.text = self.gradingSections[indexPath.row]
//            cell.textLabel?.font = UIFont(name: "BookAntiqua", size: 20)
            
//            cell.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            cell.imageView?.image = UIImage(named: self.thumbnails[indexPath.row])
            cell.imageView?.contentMode = .scaleAspectFit
            
            return cell
        }
    
        // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            switch indexPath.row {
            case 0:
                performSegue(withIdentifier: "SegueFromGradingMaterialToRequirements", sender: self)
            case 1:
                performSegue(withIdentifier: "SegueFromGradingMaterialToPatterns", sender: self)
            case 2:
                performSegue(withIdentifier: "SegueFromGradingMaterialToTerminology", sender: self)
            default:
                performSegue(withIdentifier: "SegueFromGradingMaterialToRequirements", sender: self)
            }
            
            
            tableView.deselectRow(at: indexPath, animated: false)
            
            //print("You tapped cell number \(indexPath.row).")
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.destination is RequirementsViewController)
        {
            let vc = segue.destination as? RequirementsViewController
            vc?.selectedBelt = selectedBelt
        } else {
            if (segue.destination is PatternsViewController) {
                
                let vc = segue.destination as? PatternsViewController
                vc?.selectedBelt = selectedBelt
            }
        }
    }
    
}
