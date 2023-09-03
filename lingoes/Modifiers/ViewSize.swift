//
//  ViewSize.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct ViewSizeModifier: ViewModifier {
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        width = geometry.size.width
                        height = geometry.size.height
                    }
                    .onChange(of: geometry.size.width) { newWidth in
                        width = newWidth
                    }
                    .onChange(of: geometry.size.height) { newHeight in
                        height = newHeight
                    }
            }
        )
    }
}

extension View {
    func viewSize(width: Binding<CGFloat> = .constant(0), height: Binding<CGFloat> = .constant(0)) -> some View {
        self.modifier(ViewSizeModifier(width: width, height: height))
    }
}
