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

// Not super pretty, but since SwiftUI draws outlines outward from the Shape's bounding rect,
// we must calculate the padding when using strokes of different thickness
var totalOutlinePadding: CGFloat {
    outlineWidth * CGFloat(integerLiteral: outlineColors.count) - (outlineWidth / 2)
}

var badgeFeaturePadding: CGFloat {
    totalOutlinePadding + (badgeFeatureStrokeWidth / 2)
}

var badgeView: some View {
    BadgeView()
        .padding(badgeFeatureStrokeWidth / 3) // ensure the text runs through the center of the badge stroke
}

struct StickerView : View {
    var body: some View {
        VStack {
            ZStack {
                ForEach((0...outlineColors.count - 1), id: \.self) { index in
                    Circle()
                        .stroke(outlineColors[index], lineWidth: outlineWidth)
                        .padding(outlineWidth * CGFloat(integerLiteral: index))
                }
                
                BadgeLabel()
                
                HStack {
                    Text("20")
                        .frame(width: badgeFeatureStrokeWidth + 1, height: 35, alignment: .center)
                        .font(.custom("MyriadPro-Semibold", size: 22))
                        .foregroundColor(.black)
                    Spacer()
                    Text("19")
                        .frame(width: badgeFeatureStrokeWidth + 1, height: 35, alignment: .center)
                        .font(.custom("MyriadPro-Semibold", size: 22))
                        .foregroundColor(.black)
                }
                .background(Color.white)
                .padding(totalOutlinePadding)
                
                // TODO use state to conditionally add a tiny bit of padding between like the HBO sticker's space (if desired)
                Image("wt_horizontal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 225, maxHeight: 225) // TODO this isn't great on iPad
                    .clipped()
                    .padding(badgeFeaturePadding + badgeFeatureStrokeWidth / 2)
            }
            .aspectRatio(1, contentMode: .fit)
            .padding(10)
            .overlay(badgeView)
            .frame(width: 500)
            
            Spacer()
        }
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
