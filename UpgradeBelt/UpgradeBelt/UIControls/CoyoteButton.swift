//
//  CoyoteButton.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 21/07/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
final class CoyoteButton: UIButton {

    let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 1.0)
    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.green.cgColor

    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.black,for: .normal)
            
        }
    }

    override init(frame: CGRect){
        super.init(frame: frame)
        self.borderColor = lightGreenColor.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 5 //self.frame.size.width / 2.0
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.layer.backgroundColor = lightGreenColor.cgColor
        
        let image = UIImage(named: "icon_patterns.png")
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.setImage(image, for: UIControl.State.normal)
        
//        self.imageView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        self.titleLabel?.font = UIFont(name: "BookAntiqua", size: 15)
    
    }
    
    
}
