//
//  Badge.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 8/30/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import SwiftUI

var outlineColors: [Color] = [.blue, .black, .blue]

let lineWidth = CGFloat(integerLiteral: 8)

struct Badge : View {

    var body: some View {
        ZStack {
            ForEach((0...outlineColors.count - 1), id: \.self) { index in
                Circle()
                    .stroke(outlineColors[index], lineWidth: lineWidth)
                    .padding(lineWidth * CGFloat(integerLiteral: index))
            }
        }
        .padding(10)
    }
}

struct MyShape : Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()

        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.insetBy(dx: 30.0, dy: 0.0).size.width / 2, startAngle: .degrees(-5), endAngle: .degrees(180), clockwise: true)

        return p.strokedPath(.init(lineWidth: 35))
    }
}

#if DEBUG
struct Badge_Previews : PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
