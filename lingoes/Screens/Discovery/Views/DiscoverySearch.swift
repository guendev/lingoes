//
//  DiscoverySearch.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct DiscoverySearch: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct DiscoverySearch_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
