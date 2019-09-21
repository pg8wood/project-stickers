//
//  ActivityView.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 9/21/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import UIKit
import SwiftUI

struct ActivityView: UIViewControllerRepresentable {

    let activityItems: [Any]

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
                                        applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityView>) {
        // Nothing to do
    }
}
