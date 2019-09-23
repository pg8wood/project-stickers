//
//  Badge.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 8/30/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import SwiftUI

struct StickerView : View {
    
    // These will all be cuztomizable eventually
    private let outlineColors: [Color] = [.blue, .red, .white]
    private let stickerDiameter: CGFloat = 250
    private let strokeWidth: CGFloat = 15
    private let labelPadding: CGFloat = 10
    
    private let badgeView = BadgeView()

    private var badgeFeatureDiameter: CGFloat {
        diameter(for: outlineColors.count)
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<outlineColors.count, id: \.self) { index in
                self.outlineColors[index]
                    .clipShape(Circle())
                    .frame(width: self.diameter(for: index) , height: self.diameter(for: index))
            }
            
            badgeView
                .padding(labelPadding)
                .frame(width: badgeFeatureDiameter, height: badgeFeatureDiameter)
                .background(Color.black.clipShape(Circle()))
            
            Color.blue
                .clipShape(Circle())
                .padding(2 * labelPadding) // keep the badgeView's text centered
                .frame(width: badgeFeatureDiameter - 2 * badgeView.fontHeight, height: badgeFeatureDiameter - 2 * badgeView.fontHeight)
        }
    }
    
    private func diameter(for index: Int) -> CGFloat {
        stickerDiameter - CGFloat(integerLiteral: index) * strokeWidth
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
