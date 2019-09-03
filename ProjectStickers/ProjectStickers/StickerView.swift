//
//  Badge.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 8/30/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import SwiftUI

var outerColor: Color = .blue
var midColor: Color = .black
var innerColor: Color = .blue

let lineWidth = CGFloat(integerLiteral: 10)

struct Badge : View {
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(outerColor, lineWidth: lineWidth)
                .padding(10)
            Circle()
                .stroke(midColor, lineWidth: lineWidth)
                .padding(20)
            Circle()
                .stroke(innerColor, lineWidth: lineWidth)
                .padding(30)
        }
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
