//
//  Badge.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 8/30/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import SwiftUI

var outlineColors: [Color] = [.blue, .red, .blue]

var outlineWidth: CGFloat = 6.0
var badgeFeatureWidth: CGFloat = 40.0

// Not super pretty, but since SwiftUI draws outlines outward from the Shape's bounding rect,
// we must calculate the padding when using strokes of different thickness
var badgeFeaturePadding: CGFloat {
    let totalOutlinePadding =
        outlineWidth * CGFloat(integerLiteral: outlineColors.count) - (outlineWidth / 2)
    
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
        }
        .padding(10)
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
