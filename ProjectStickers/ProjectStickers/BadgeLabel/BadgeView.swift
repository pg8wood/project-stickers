//
//  BadgeView.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 9/4/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import SwiftUI
import UIKit

struct BadgeView : View {

    var body: some View {
        Test()
    }
}

struct Test: UIViewRepresentable {
    func updateUIView(_ uiView: BadgeLabelUIView, context: UIViewRepresentableContext<Test>) {
        // nothing to do
    }

    
    func makeUIView(context: Context) -> BadgeLabelUIView {
        return BadgeLabelUIView()
    }
}
