//
//  SnapCarouselSlider.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct SnapCarouselSlider<T, Content: View>: View {
    let items: [T]
    let content: (T) -> Content
    
    @Binding var currentIndex: Int
    @GestureState private var dragOffset: CGFloat = 0
    
    private var slidesPerView: CGFloat = 1
    private var spaceBetween: CGFloat = 10
    
    init(items: [T], currentIndex: Binding<Int> = .constant(0), @ViewBuilder content: @escaping (T) -> Content) {
        self.items = items
        self._currentIndex = currentIndex
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("\(getOffsetX(geometry)) \(getItemWidth(geometry)) \(geometry.size.width)")
                
                LazyHStack(spacing: spaceBetween) {
                    ForEach(items.indices, id: \.self) { index in
                        content(items[index])
                            .frame(width: getItemWidth(geometry), height: geometry.size.height)
                    }
                }
                .offset(x: getOffsetX(geometry))
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            onDragEnded(value: value, geometry: geometry)
                        }
                )
                .animation(.easeInOut, value: dragOffset == 0)
            }
        }
        .background(Color.black.opacity(0.2))
    }
    
    private func getItemWidth(_ geometry: GeometryProxy) -> CGFloat {
        let totalSpaceBetween = spaceBetween * (slidesPerView - 1)
        return (geometry.size.width - totalSpaceBetween) / slidesPerView
    }
    
    private func getOffsetX(_ geometry: GeometryProxy) -> CGFloat {
        let itemWidth = getItemWidth(geometry)
        let totalSpaceBetween = spaceBetween * (slidesPerView - 1)
        let offset = -CGFloat(currentIndex) * (itemWidth + spaceBetween)
        return offset + dragOffset
    }
    
    private func onDragEnded(value: DragGesture.Value, geometry: GeometryProxy) {
        let offset = value.translation.width
        let process = -offset / getItemWidth(geometry)
        let roundIndex = process.rounded()
        
        currentIndex = max(min(currentIndex + Int(roundIndex), items.count - 1), 0)
    }
}

extension SnapCarouselSlider {
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
