//
//  PreviewHelper.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct PreviewHelper<Content>: View where Content: View  {
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        
        content()
            .environment(\.colorScheme, .dark)
        
        content()
            .environment(\.colorScheme, .light)
        
    }
}
