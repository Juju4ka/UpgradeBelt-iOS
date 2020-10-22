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
        
        self.layer.contentsScale = UIScreen.main.nativeScale
        
        //// Color Declarations
        let darkGreenColor = UIColor(red: 78.0/255.0, green: 105.0/255.0, blue: 75.0/255.0, alpha: 1.0)
        let lightGreenColor = UIColor(red: 189.0/255.0, green: 234.0/255.0, blue: 167.0/255.0, alpha: 1.0)
        
        let darkOrangeColor = UIColor(red: 254.0/255.0, green: 142.0/255.0, blue: 31.0/255.0, alpha: 1.0)
        let lightOrangeColor = UIColor(red: 253.0/255.0, green: 187.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(rect)
        context.drawPath(using: .fillStroke)

        let basicDeltaXUpper1 = -40
        let basicDeltaYUpper1 = -20
        
        let basicDeltaXUpper2 = 25
        let basicDeltaYUpper2 = -147
        
        let basicDeltaXLower1 = 97
        let basicDeltaYLower1 = 154
        
        let basicDeltaXLower2 = 319
        let basicDeltaYLower2 = 127
        
        let basicWidthSmall = 204
        let basicHeightSmall = 204
        let basicWidthLarge = 294
        let basicHeightLarge = 294
        
        let basicW = 375
        let basicH = 667
        
        // Upper circles Delta's
        let deltaXUpper1 = (basicDeltaXUpper1 * Int(rect.size.width)) / basicW
        let deltaYUpper1 = (basicDeltaYUpper1 * Int(rect.size.height)) / basicH
        
        let deltaXUpper2 = (basicDeltaXUpper2 * Int(rect.size.width)) / basicW
        let deltaYUpper2 = (basicDeltaYUpper2 * Int(rect.size.height)) / basicH
        
        // Circle sizes
        let smallWidth = (basicWidthSmall * Int(rect.size.width)) / basicW
        let smallHeight = (basicHeightSmall * Int(rect.size.height)) / basicH

        let smallMid = (smallWidth + smallHeight) / 2
        
        let largeWidth = (basicWidthLarge * Int(rect.size.width)) / basicW
        let largeHeight = (basicHeightLarge * Int(rect.size.height)) / basicH
        
        let largeMid = (largeWidth + largeHeight) / 2
        
        // Lower circles Delta's
        let deltaXLower1 = (basicDeltaXLower1 * Int(rect.size.width)) / basicW
        let deltaYLower1 = (basicDeltaYLower1 * Int(rect.size.height)) / basicH
        
        let deltaXLower2 = (basicDeltaXLower2 * Int(rect.size.width)) / basicW
        let deltaYLower2 = (basicDeltaYLower2 * Int(rect.size.height)) / basicH
        
        // Draw dark green circle
        context.setFillColor(darkGreenColor.cgColor)
        context.setStrokeColor(darkGreenColor.cgColor)
        context.addEllipse(in: CGRect(x: deltaXUpper1, y: deltaYUpper1, width: smallMid, height: smallMid))
        context.drawPath(using: .fillStroke)

        // Draw light green circle
        context.setFillColor(lightGreenColor.cgColor)
        context.setStrokeColor(lightGreenColor.cgColor)
        context.addEllipse(in: CGRect(x: deltaXUpper2, y: deltaYUpper2, width: largeMid, height: largeMid))
        context.drawPath(using: .fillStroke)


        // Draw dark orange circle
        context.setFillColor(darkOrangeColor.cgColor)
        context.setStrokeColor(darkOrangeColor.cgColor)
        context.addEllipse(in: CGRect(x: Int(rect.size.width)-deltaXLower1, y: Int(rect.size.height) - deltaYLower1, width: smallMid, height: smallMid))
        context.drawPath(using: .fillStroke)

        // Draw light orange circle
        context.setFillColor(lightOrangeColor.cgColor)
        context.setStrokeColor(lightOrangeColor.cgColor)
        context.addEllipse(in: CGRect(x: Int(rect.size.width) - deltaXLower2, y: Int(rect.size.height)-deltaYLower2, width: largeMid, height: largeMid))
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
