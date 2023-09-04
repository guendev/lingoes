//
//  OverlookFriends.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverlookFriends: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Friend’s")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color("Text"))
            
            HStack(spacing: 10) {
                
                ForEach(0...2, id: \.self) { item in
                    Circle()
                        .fill(Color("Background2"))
                        .frame(width: 40, height: 40)
                }
                
                Circle()
                    .fill(Color.accentColor)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Text("8+")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                
                Spacer()
                
                
                Button {
                    
                } label: {
                    
                    Text("Learn now")
                    
                }
                .buttonStyle(PrimaryButtonStyle())

                
            }
            
        }
        .padding([.horizontal, .top])
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(alignment: .top) {
            
            Rectangle()
                .fill(Color("Border"))
                .frame(height: 1)
            
        }
    }
}

struct OverFriends_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OverlookView()
                .environment(\.colorScheme, .light)
            
            OverlookView()
                .environment(\.colorScheme, .dark)
        }
    }
}
