//
//  DiscoveryRecommendationItem.swift
//  lingoes
//
//  Created by Guen on 06/09/2023.
//

import SwiftUI

struct DiscoveryRecommendationItem: View {
    
    var item: RecommendationItem
    
    @State var width: CGFloat = .zero
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            SizeBox(height: getOffsetTop() / 2)
            

            Text("Toeic 990")
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
            
            SizeBox(height: 8)
            
            Text("By Guen")
                .font(.footnote)
                .foregroundColor(Color("Text2"))
            
            SizeBox(height: 8)
            
            HStack(spacing: 30) {
                
                HStack(spacing: 4) {
                    
                    Image(systemName: "pencil.and.outline")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                    
                    Text("160")
                        .font(.footnote)
                    
                }
                
                HStack(spacing: 4) {
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                    
                    Text("14h")
                        .font(.footnote)
                    
                }
                
            }
            .foregroundColor(Color("Text2"))
        }
        .padding(.horizontal)
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            Color("Background2")
        }
        .cornerRadius(15)
        .clipped()
        .padding(.top, getOffsetTop() / 2)
        .sizeDetector(width: $width)
        .overlay(alignment: .top) {
            Circle()
                .fill(Color("Background2"))
                .frame(width: getOffsetTop())
                .overlay {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .scaleEffect(0.7)
                }
        }
    }
    
    
    func getOffsetTop() -> CGFloat {
        width * 0.5
    }
}

struct DiscoveryRecommendationItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
