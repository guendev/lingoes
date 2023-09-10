//
//  DiscoveryRecommendation.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct RecommendationItem: Identifiable {
    var id: String = UUID().uuidString
    var color: String
}

struct DiscoveryRecommendation: View {
    
    var items: [RecommendationItem] = [
        RecommendationItem(color: "#FFE450"),
        RecommendationItem(color: "#ECC6C0"),
        RecommendationItem(color: "#CDC1ED")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recommend for you")
                .font(.headline)
                .foregroundColor(Color("Text"))
            
            BasicCarouselSlider(items: items) { item in
                
                DiscoveryRecommendationItem(item: item)
                
            }
            .slidesPerView(2.2)
            .spaceBetween(22)
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
