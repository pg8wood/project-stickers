//
//  StickerView.swift
//  project-stickers
//
//  Created by Patrick Gatewood on 7/31/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import UIKit

@IBDesignable
class StickerView: UIView {
    
    @IBInspectable var outlineThickness: CGFloat = 7
    @IBInspectable var textBackgroundOutlineThickness: CGFloat = 20
    @IBInspectable var outerOutlineColor: UIColor = .black
    @IBInspectable var middleOutlineColor: UIColor = .red
    @IBInspectable var innerOutlineColor: UIColor = .darkGray
    @IBInspectable var textBackgroundOutlineColor: UIColor = .blue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    private func sharedInit() {
        clipsToBounds = true
        drawStickerOutlines()
    }
    
    private func drawStickerOutlines() {
        drawOutline(in: bounds, color: outerOutlineColor.cgColor, thickness: outlineThickness)
        
        var outlineInset = outlineThickness
        drawOutline(in: bounds.insetBy(dx: outlineInset, dy: outlineInset), color: middleOutlineColor.cgColor, thickness: outlineThickness)
        
        outlineInset = CGFloat(integerLiteral: 2) * outlineThickness
        drawOutline(in: bounds.insetBy(dx: outlineInset, dy: outlineInset), color: innerOutlineColor.cgColor, thickness: outlineThickness)
        
        drawTextBackgroundOutline()
    }
    
    private func drawOutline(in rect: CGRect, color: CGColor, thickness: CGFloat) {
        let insetValue = outlineThickness / 2
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: insetValue, dy: insetValue))
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = color
        circleLayer.lineWidth = thickness
        
        layer.addSublayer(circleLayer)
    }
    
    private func drawTextBackgroundOutline() {
        let outlineInset = CGFloat(integerLiteral: 3) * outlineThickness + ((textBackgroundOutlineThickness - outlineThickness) / 2)
        drawOutline(in: bounds.insetBy(dx: outlineInset, dy: outlineInset), color: textBackgroundOutlineColor.cgColor, thickness: textBackgroundOutlineThickness)
    }
}
