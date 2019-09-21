//
//  Badge.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 8/30/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import SwiftUI

let outlineColors: [Color] = [.blue, .red, .white]

var outlineWidth: CGFloat = 6.0
var badgeFeatureStrokeWidth: CGFloat = 40.0

var stickerDiameter: CGFloat = 250
var strokeWidth: CGFloat = 15

private func diameter(for index: Int) -> CGFloat {
    stickerDiameter - CGFloat(integerLiteral: index) * strokeWidth
}

private var badgeFeatureDiameter: CGFloat {
    diameter(for: outlineColors.count)
}

private let badgeView = BadgeView()

struct StickerView : View {
    var body: some View {
        ZStack {
            ForEach(0..<outlineColors.count, id: \.self) { index in
                outlineColors[index]
                    .clipShape(Circle())
                    .frame(width: diameter(for: index) , height: diameter(for: index))
            }
            
            // TODO:
            // Figure out if a circle with the text overlayed is better or if
            // using the badgeView with a background shape is better.
            // Hardest part right now is getting the text centered within the outline
            Color.black
                .clipShape(Circle())
                .frame(width: badgeFeatureDiameter, height: badgeFeatureDiameter)
            badgeView.frame(width: badgeFeatureDiameter, height: badgeFeatureDiameter)
//                .background(Color.black.clipShape(Circle()))
            Color.blue
                .clipShape(Circle())
                // TODO need to figure out what the insets here need to be
                .frame(width: badgeFeatureDiameter - badgeView.font.lineHeight, height: badgeFeatureDiameter - badgeView.font.lineHeight)
            
            // End TODO

            
            
            // old
            // -------------------
            
            
//            Color.blue.clipShape(Circle())
//                .frame(width: stickerDiameter, height: stickerDiameter)
//            Color.red.clipShape(Circle())
//                .frame(width: 240, height: 240)
//            Color.white.clipShape(Circle())
//                .frame(width: 240, height: 240)
        }
//        Color.blue.clipShape(Circle())
//            .frame(width: 250, height: 250)
//            .overlay(Circle()
//                .stroke(Color.black, lineWidth: badgeFeatureStrokeWidth).padding(badgeFeatureStrokeWidth / 2))
//            .overlay(BadgeView(drawingRectInsets: badgeFeatureStrokeWidth / 2).padding(5))
//            .overlay(Image("wt_horizontal")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .padding(50)
//                .frame(width: 250, height: 250))
//            .overlay(Circle()
//                    .stroke(Color.white, lineWidth: outlineWidth))
//                    .overlay(Circle()
//                             .stroke(Color.red, lineWidth: outlineWidth)
//                             .padding(-outlineWidth)
//                             .overlay(Circle()
//                                      .stroke(Color.blue, lineWidth: outlineWidth)
//                                      .padding(-2 * outlineWidth)))
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            StickerView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            StickerView()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
            
            StickerView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (3rd generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (3rd generation)")
        }
    }
}
#endif
