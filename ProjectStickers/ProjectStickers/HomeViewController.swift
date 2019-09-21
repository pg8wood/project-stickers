//
//  HomeViewController.swift
//  ProjectStickers
//
//  Created by Patrick Gatewood on 9/21/19.
//  Copyright © 2019 Patrick Gatewood. All rights reserved.
//

import UIKit
import SwiftUI

struct HomeView: View {
    @State private var rect1: CGRect = .zero
    @State private var rect2: CGRect = .zero
    @State private var uiViewImage: UIImage? = nil
    
    @State var showingShareSheet: Bool = false

    var body: some View {
        VStack {
            StickerView()
                .background(RectGetter(rect: $rect1))
                .background(Color.red)
                .onTapGesture {
                    // Note: Until `UIGraphicsRenderer` is ported to SwiftUI, this will probably continue to look ugly and hacky
                    self.uiViewImage = UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: self.rect1)
                    self.showingShareSheet = true
                    
           
            }
            
            if uiViewImage != nil {
                VStack {
                    Text("Captured Image")
                    Image(uiImage: self.uiViewImage!).padding(20).border(Color.black)
                }.padding(20)
            }
            
             Spacer()
        }
//        .sheet(isPresented: $showingShareSheet, content: {
//            ActivityView(activityItems: [self.uiViewImage!])
//        })
    }
}

private struct RectGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { proxy in
            self.createView(proxy: proxy)
        }
    }

    func createView(proxy: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = proxy.frame(in: .global)
        }

        return Rectangle().fill(Color.clear)
    }
}
