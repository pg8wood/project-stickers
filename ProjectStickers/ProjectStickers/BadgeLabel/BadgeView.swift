//
//  BadgeView.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 9/4/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import SwiftUI
import UIKit

struct BadgeView: UIViewRepresentable {
    let drawingRectInsets: CGFloat!
    
    init(drawingRectInsets: CGFloat = 0) {
        self.drawingRectInsets = drawingRectInsets
    }
    
    func updateUIView(_ uiView: BadgeLabelUIView, context: UIViewRepresentableContext<BadgeView>) {
        // nothing to do
    }

    
    func makeUIView(context: Context) -> BadgeLabelUIView {
        return BadgeLabelUIView(drawingRectInsets: drawingRectInsets)
    }
}

#if DEBUG
struct BadgeLabelView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            BadgeView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            BadgeView()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
            
            BadgeView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (3rd generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (3rd generation)")
        }
    }
}
#endif
