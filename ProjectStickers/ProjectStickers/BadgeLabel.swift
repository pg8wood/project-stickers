//
//  BadgeLabel.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 9/4/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import SwiftUI

struct BadgeLabel: View {
    
//    func badgeView() -> View {
//        BadgeView()
////        .fr
//    }
    
    var body: some View {
        ZStack { // remove
            Circle()
                .stroke(Color.black, lineWidth: badgeFeatureStrokeWidth)
//                .border(Color.red, width: 5)
                
                .aspectRatio(1, contentMode: .fit)
                .padding(badgeFeaturePadding)
        }
    }
}

struct BadgeLabel_Previews: PreviewProvider {
    static var previews: some View {
        BadgeLabel()
    }
}
