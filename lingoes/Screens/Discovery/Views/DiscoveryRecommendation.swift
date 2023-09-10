//
//  DiscoveryRecommendation.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct RecommendationItem: Identifiable {
    var id: String = UUID().uuidString
    var name: String
}

struct DiscoveryRecommendation: View {
    
    var items: [RecommendationItem] = [
        RecommendationItem(
            name: "Cloud Ear Pink"
        ),
        RecommendationItem(
            name: "Glacier Ear Blue"
        ),
        RecommendationItem(
            name: "Basic slangs"
        )
    ]
    
    var body: some View {
        SessionView(title: "Recommend for you") {
            
            VStack(spacing: 16) {
                
                ForEach(items) { item in
                    HStack(spacing: 16) {
                        
                        Circle()
                            .fill(Color("Background"))
                            .frame(width: 56)
                        
                        VStack(alignment: .leading) {
                            
                            Text(item.name)
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(Color("Text"))
                            
                            HStack(spacing: 20) {
                                
                                HStack(spacing: 4) {
                                    
                                    Image(systemName: "person")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 14, height: 14)
                                    
                                    Text("Guen")
                                        .font(.subheadline)
                                    
                                }
                                
                                HStack(spacing: 4) {
                                    
                                    Image(systemName: "pencil.and.outline")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 14, height: 14)
                                    
                                    Text("160")
                                        .font(.subheadline)
                                    
                                }
                                                                
                                HStack(spacing: 4) {
                                    
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 14, height: 14)
                                    
                                    Text("14h")
                                        .font(.subheadline)
                                    
                                }
                                
                            }
                            .foregroundColor(Color("Text2"))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background {
                        Color("Background2")
                    }
                    .cornerRadius(28)
                }
                
            }
            
        }
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
