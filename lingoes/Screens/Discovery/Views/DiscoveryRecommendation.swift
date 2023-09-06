//
//  DiscoveryRecommendation.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct DiscoveryRecommendation: View {
    
    var items: [Color] = [.black, .blue, .red, .brown, .gray, .blue, .gray, .indigo, .orange]
    
    @State var currentIndex: Int = .zero
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recommend for you \(currentIndex)")
                .font(.headline)
                .foregroundColor(Color("Text"))
            
            SnapCarouselSlider(items: items, currentIndex: $currentIndex) { item in
                
                item
                    .cornerRadius(20)
                
            }
            .slidesPerView(4.3)
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
