//
//  DiscoveryRecommendation.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct DiscoveryRecommendation: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommend for you")
                .font(.headline)
                .foregroundColor(Color("Text"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct DiscoveryRecommendation_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
