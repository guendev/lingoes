//
//  Sizeable.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct Sizeable<Content>: View where Content: View  {
    var content: (_ size: CGSize) -> Content
    
    @State var size: CGSize = .zero

    init(@ViewBuilder content: @escaping (_ size: CGSize) -> Content) {
        self.content = content
    }
    
    var body: some View {
        content(size)
            .frame(maxWidth: .infinity)
            .sizeDetector(width: $size.width, height: $size.height)
    }
}
