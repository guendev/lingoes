//
//  SessionView.swift
//  lingoes
//
//  Created by Guen on 07/09/2023.
//

import SwiftUI

struct SessionView<Content, Title>: View where Content: View, Title: View {
    var title: () -> Title
    var content: () -> Content
    
    init(
        title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }
    
    init(
        title: String,
        @ViewBuilder content: @escaping () -> Content
    ) where Title == Text {
        self.title = {
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color("Text"))
        }
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            title()
            
            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
