//
//  DiscoveryRecommendation.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct DiscoveryRecommendation: View {
    
    var items: [Color] = [.black, .blue, .red, .brown, .gray, .blue, .gray, .indigo, .orange]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recommend for you")
                .font(.headline)
                .foregroundColor(Color("Text"))
            
            BasicCarouselSlider(items: items) { item in
                
                item
                    .cornerRadius(20)
                
            }
            .slidesPerView(3.3)
            .spaceBetween(16)
            .frame(height: 200)
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
