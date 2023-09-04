//
//  OverlookLevels.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverlookLevels: View {
    var levels: [Level] = [
        Level(title: "Introducing", subtitle: "About user interface"),
        Level(title: "Theory", subtitle: "How to learn ui/ux design"),
        Level(title: "Clossing", subtitle: "Question and answer session")
    ]
    
    var body: some View {
        VStack(spacing: 17) {
            
            ForEach(levels) { level in
                OverlookLevelItem(level: level)
            }
            
        }
    }
}

struct OverlookLevels_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OverlookView()
                .environment(\.colorScheme, .light)
            
            OverlookView()
                .environment(\.colorScheme, .dark)
        }
    }
}
