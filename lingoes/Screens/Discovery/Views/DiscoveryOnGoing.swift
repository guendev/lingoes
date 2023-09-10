//
//  DiscoveryOnGoing.swift
//  lingoes
//
//  Created by Guen on 07/09/2023.
//

import SwiftUI

struct DiscoveryOnGoing: View {
    var body: some View {
        SessionView(title: "OnGoing") {
            
        }
    }
}

struct DiscoveryOnGoing_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
