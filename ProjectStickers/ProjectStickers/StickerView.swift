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
var badgeFeatureWidth: CGFloat = 40.0

// Not super pretty, but since SwiftUI draws outlines outward from the Shape's bounding rect,
// we must calculate the padding when using strokes of different thickness
var totalOutlinePadding: CGFloat {
    outlineWidth * CGFloat(integerLiteral: outlineColors.count) - (outlineWidth / 2)
}

var badgeFeaturePadding: CGFloat {
    return totalOutlinePadding + (badgeFeatureWidth / 2)
}

struct Badge : View {
    var body: some View {
        ZStack {
            ForEach((0...outlineColors.count - 1), id: \.self) { index in
                Circle()
                    .stroke(outlineColors[index], lineWidth: outlineWidth)
                    .padding(outlineWidth * CGFloat(integerLiteral: index))
            }
            
            Circle()
                .stroke(Color.black, lineWidth: badgeFeatureWidth)
                .padding(badgeFeaturePadding)
            
            HStack {
                Text("20")
                    .frame(width: badgeFeatureWidth, height: 30, alignment: .center)
                Spacer()
                Text("19")
                    .frame(width: badgeFeatureWidth, height: nil, alignment: .center)
            }
            .background(Color.white)
            .padding(totalOutlinePadding)
        }
        .padding(10)
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
       Group {
          Badge()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")

          Badge()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("iPhone XS Max")
        
            Badge()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (3rd generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (3rd generation)")
       }
    }
}
#endif
