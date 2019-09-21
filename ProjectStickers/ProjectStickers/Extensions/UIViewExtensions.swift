//
//  UIViewExtensions.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 9/21/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import UIKit

extension UIView {
    func asImage(rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
