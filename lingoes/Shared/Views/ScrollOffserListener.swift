//
//  ScrollOffserListener.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct ScrollOffserListener: View {
    var onChange: (_ offset: CGFloat) -> Void
    
    var body: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear
                .onChange(of: offset) { newValue in
                    onChange(newValue)
                }
        }
    }
}
