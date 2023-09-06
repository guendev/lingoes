//
//  ViewSize.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct SizeDetectorModifier: ViewModifier {
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        updateSize(with: geometry.size)
                    }
                    .onChange(of: geometry.size) { newSize in
                        updateSize(with: newSize)
                    }
            }
        )
    }
    
    private func updateSize(with size: CGSize) {
        DispatchQueue.main.async {
            width = size.width
            height = size.height
        }
    }
}

extension View {
    func sizeDetector(width: Binding<CGFloat> = .constant(0), height: Binding<CGFloat> = .constant(0)) -> some View {
        self.modifier(SizeDetectorModifier(width: width, height: height))
    }
}
