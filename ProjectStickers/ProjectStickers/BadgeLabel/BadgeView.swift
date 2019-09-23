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
    var fontHeight: CGFloat {
        return UIFont.myriadSemiBold(25).lineHeight
//        return label.fontHeight
    }
    
    private var label: BadgeLabelUIView = BadgeLabelUIView(font: .myriadSemiBold(25))
    
    func updateUIView(_ uiView: BadgeLabelUIView, context: UIViewRepresentableContext<BadgeView>) {
        // nothing to do
    }

    func makeUIView(context: Context) -> BadgeLabelUIView {
        label.text = "test hello this is a label".uppercased()
        label.textColor = .white
        return label
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
