//
//  PPSheetContainer.swift
//  PearPassAutoFillExtension
//
//  V2 translucent sheet container. Mirrors Android's
//  Theme.PearPass.Autofill.Fullscreen.V2 + activity_authentication_v2.xml.
//
//  Behavior: 85% screen height, bottom-anchored, dim backdrop, content card on top.
//

import SwiftUI

struct PPSheetContainer<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                PPColors.background
                    .opacity(0.5)
                    .ignoresSafeArea()

                content
                    .frame(maxWidth: .infinity)
                    .frame(height: proxy.size.height * 0.85)
                    .background(PPColors.background)
            }
        }
    }
}
