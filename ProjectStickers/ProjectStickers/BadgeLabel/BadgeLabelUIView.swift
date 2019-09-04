//
//  BadgeLabelUIView.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 9/4/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import UIKit

// Taken almost entirely from this wonderful answer: https://stackoverflow.com/questions/32771864/draw-text-along-circular-path-in-swift-for-ios
class BadgeLabelUIView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    required init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)!
        sharedInit()
    }
    
    func sharedInit() {
        superview?.clipsToBounds = false
        superview?.layer.masksToBounds = false
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let size = self.bounds.size
        
        context.translateBy(x: size.width / 2, y: size.height / 2)
        context.scaleBy(x: 1, y: -1)
        
        // Inset the drawing rect by the same padding of its parent SwiftUI View, otherwise the
        // drawing done from this UIView will be clipped!
        let rect = rect.insetBy(dx: badgeFeaturePadding, dy: badgeFeaturePadding)

        centreArcPerpendicular(text: "HELLO WORLD", context: context, radius: (rect.size.width / 2), centerTextAngle: CGFloat(Double.pi / 2), colour: .white, font: .myriadSemiBold(25), clockwise: true)
        centreArcPerpendicular(text: "PROJECT STICKERS ARE AWESOME", context: context, radius: -rect.size.width / 2, centerTextAngle: CGFloat(Double.pi / 2), colour: UIColor.white, font: .myriadSemiBold(25), clockwise: true)
    }
    
    private func setTopLabel(text: String) {
        
    }

    // TODO make documentation. Say angle uses radians
    func centreArcPerpendicular(text str: String, context: CGContext, radius r: CGFloat, centerTextAngle theta: CGFloat, colour c: UIColor, font: UIFont, clockwise: Bool){
        // *******************************************************
        // This draws the String str around an arc of radius r,
        // with the text centred at polar angle theta
        // *******************************************************

        let characters: [String] = str.map { String($0) } // An array of single character strings, each character in str
        let l = characters.count
        let attributes = [NSAttributedString.Key.font: font]

        var arcs: [CGFloat] = [] // This will be the arcs subtended by each character
        var totalArc: CGFloat = 0 // ... and the total arc subtended by the string

        // Calculate the arc subtended by each letter and their total
        for i in 0 ..< l {
            arcs += [chordToArc(characters[i].size(withAttributes: attributes).width, radius: r)]
            totalArc += arcs[i]
        }

        // Are we writing clockwise (right way up at 12 o'clock, upside down at 6 o'clock)
        // or anti-clockwise (right way up at 6 o'clock)?
        let direction: CGFloat = clockwise ? -1 : 1
        let slantCorrection: CGFloat = clockwise ? -.pi / 2 : .pi / 2

        // The centre of the first character will then be at
        // thetaI = theta - totalArc / 2 + arcs[0] / 2
        // But we add the last term inside the loop
        var thetaI = theta - direction * totalArc / 2

        for i in 0 ..< l {
            thetaI += direction * arcs[i] / 2
            // Call centerText with each character in turn.
            // Remember to add +/-90º to the slantAngle otherwise
            // the characters will "stack" round the arc rather than "text flow"
            centre(text: characters[i], context: context, radius: r, angle: thetaI, colour: c, font: font, slantAngle: thetaI + slantCorrection)
            // The centre of the next character will then be at
            // thetaI = thetaI + arcs[i] / 2 + arcs[i + 1] / 2
            // but again we leave the last term to the start of the next loop...
            thetaI += direction * arcs[i] / 2
        }
    }

    func chordToArc(_ chord: CGFloat, radius: CGFloat) -> CGFloat {
        // *******************************************************
        // Simple geometry
        // *******************************************************
        return 2 * asin(chord / (2 * radius))
    }

    func centre(text str: String, context: CGContext, radius r: CGFloat, angle theta: CGFloat, colour c: UIColor, font: UIFont, slantAngle: CGFloat) {
        // *******************************************************
        // This draws the String str centred at the position
        // specified by the polar coordinates (r, theta)
        // i.e. the x= r * cos(theta) y= r * sin(theta)
        // and rotated by the angle slantAngle
        // *******************************************************

        // Set the text attributes
        let attributes = [NSAttributedString.Key.foregroundColor: c, NSAttributedString.Key.font: font]
        //let attributes = [NSForegroundColorAttributeName: c, NSFontAttributeName: font]
        // Save the context
        context.saveGState()
        // Undo the inversion of the Y-axis (or the text goes backwards!)
        context.scaleBy(x: 1, y: -1)
        // Move the origin to the centre of the text (negating the y-axis manually)
        context.translateBy(x: r * cos(theta), y: -(r * sin(theta)))
        // Rotate the coordinate system
        context.rotate(by: -slantAngle)
        // Calculate the width of the text
        let offset = str.size(withAttributes: attributes)
        // Move the origin by half the size of the text
        context.translateBy (x: -offset.width / 2, y: -offset.height / 2) // Move the origin to the centre of the text (negating the y-axis manually)
        // Draw the text
        str.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
        // Restore the context
        context.restoreGState()
    }
}

