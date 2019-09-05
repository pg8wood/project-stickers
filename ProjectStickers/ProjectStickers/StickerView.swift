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

struct StickerView : View {
    var body: some View {
        Color.blue.clipShape(Circle())
            .frame(width: 250, height: 250)
            .overlay(Circle()
                .stroke(Color.black, lineWidth: badgeFeatureStrokeWidth).padding(badgeFeatureStrokeWidth / 2))
            .overlay(BadgeView(drawingRectInsets: badgeFeatureStrokeWidth / 2).padding(5))
            .overlay(Image("wt_horizontal")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(50)
                .frame(width: 250, height: 250))
            .overlay(Circle()
                    .stroke(Color.white, lineWidth: outlineWidth))
                    .overlay(Circle()
                             .stroke(Color.red, lineWidth: outlineWidth)
                             .padding(-outlineWidth)
                             .overlay(Circle()
                                      .stroke(Color.blue, lineWidth: outlineWidth)
                                      .padding(-2 * outlineWidth)))
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
