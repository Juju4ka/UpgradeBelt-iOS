//
//  GradientBackgroundView.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 01/07/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientBackgroundView : UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonSetup()
    }

    private func commonSetup() {
        backgroundColor = .clear
        isOpaque = false
    }
    
    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        //// Color Declarations
        let darkGreenColor = UIColor(red: 78.0/255.0, green: 105.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 1.0)
        
        let darkOrangeColor = UIColor(red: 254.0/255.0, green: 142.0/255.0, blue: 31.0/255.0, alpha: 1.0)
        let lightOrangeColor = UIColor(red: 253.0/255.0, green: 187.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(rect)
        context.drawPath(using: .fillStroke)

        // Draw dark green circle
        context.setFillColor(darkGreenColor.cgColor)
        context.setStrokeColor(darkGreenColor.cgColor)
        context.addEllipse(in: CGRect(x: -40, y: 0, width: 194, height: 194))
        context.drawPath(using: .fillStroke)

        // Draw light green circle
        context.setFillColor(lightGreenColor.cgColor)
        context.setStrokeColor(lightGreenColor.cgColor)
        context.addEllipse(in: CGRect(x: 25, y: -147, width: 294, height: 294))
        context.drawPath(using: .fillStroke)


        // Draw dark orange circle
        context.setFillColor(darkOrangeColor.cgColor)
        context.setStrokeColor(darkOrangeColor.cgColor)
        context.addEllipse(in: CGRect(x: self.frame.size.width-97, y: self.frame.size.height - 154, width: 194, height: 194))
        context.drawPath(using: .fillStroke)

        // Draw light orange circle
        context.setFillColor(lightOrangeColor.cgColor)
        context.setStrokeColor(lightOrangeColor.cgColor)
        context.addEllipse(in: CGRect(x: self.frame.size.width - 319, y: self.frame.size.height-127, width: 294, height: 294))
        context.drawPath(using: .fillStroke)
                
        
//        // Draw dark green circle
//        context.setFillColor(darkGreenColor.cgColor)
//        context.setStrokeColor(darkGreenColor.cgColor)
//        context.addEllipse(in: CGRect(x: rect.size.width/2.0 - 75, y: rect.size.height/2.0 - 75, width: 150, height: 150))
//        context.drawPath(using: .fillStroke)

        
        
        
//        let gradient = CGGradient(
//          colorsSpace: nil,
//          colors: [lightGreenColor.cgColor, darkGreenColor.cgColor] as CFArray,
//          locations: nil)
//        context.drawRadialGradient(
//          gradient!,
//          startCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
//          startRadius: bounds.width / 4,
//          endCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
//          endRadius: bounds.width,
//          options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])

//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let colors = [
//            startColor.cgColor,
//            endColor.cgColor
//        ] as CFArray
//        let locations: [CGFloat] = [startLocation, endLocation]
//        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) else {
//            UIColor.red.setFill()
//            context.fill(rect)
//            return
//        }
//
//        let start = CGPoint.zero
//        let end = CGPoint(x: 0, y: rect.height)
//
//        context.drawLinearGradient(gradient, start: start, end: end, options: [
//            .drawsBeforeStartLocation,
//            .drawsAfterEndLocation
//        ])

        
    }
    
    @IBInspectable var startColor: UIColor = UIColor(red: 78.0/255.0, green: 105.0/255.0, blue: 75.0/255.0, alpha: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var endColor: UIColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var startLocation: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var endLocation: CGFloat = 0.25 {
        didSet {
            setNeedsDisplay()
        }
    }
}
