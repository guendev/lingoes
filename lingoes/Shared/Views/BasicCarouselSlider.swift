//
//  BasicCarouselSlider.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct BasicCarouselSlider<T, Content: View>: View {
    let items: [T]
    let content: (T) -> Content
    
    private var slidesPerView: CGFloat = 1
    private var spaceBetween: CGFloat = 10
    
    @State private var width: CGFloat = .zero
    
    init(items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.items = items
        self.content = content
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: spaceBetween) {
                ForEach(items.indices, id: \.self) { index in
                    content(items[index])
                        .frame(width: getItemWidth())
                }
            }
        }
        .sizeDetector(width: $width)
    }
    
    private func getItemWidth() -> CGFloat {
        let totalSpaceBetween = spaceBetween * (slidesPerView - 1)
        return (width - totalSpaceBetween) / slidesPerView
    }
}

extension BasicCarouselSlider {
    func slidesPerView(_ slides: CGFloat) -> Self {
        var view = self
        view.slidesPerView = slides
        return view
    }
    
    func spaceBetween(_ space: CGFloat) -> Self {
        var view = self
        view.spaceBetween = space
        return view
    }
}

struct SnapCarouselSlider_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
