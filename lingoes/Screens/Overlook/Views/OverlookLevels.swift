//
//  OverlookLevels.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverlookLevels: View {
    
    @EnvironmentObject var viewModel: OverlookViewModel
    
    var body: some View {
        VStack(spacing: 17) {
            
            ForEach(viewModel.levels) { level in
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
