//
//  DiscoveryAppBar.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct DiscoveryAppBar: View {
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text("Hi, Guen")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Text2"))
                
                Text("Find Your Specialits")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                
            }
            
            Spacer()
            
            Button {
                
            } label: {
                
                Circle()
                    .fill(Color("Background2"))
                    .frame(width: 30, height: 30)
                    .overlay {
                        Image("united-states")
                            .resizable()
                            .scaledToFit()
                    }
                    .clipped()
                    .overlay {
                        Circle()
                            .stroke(Color("Border"), lineWidth: 2)
                            .frame(width: 32, height: 32)
                        
                    }
                
            }
            .buttonStyle(.plain)

        }
    }
}

struct DiscoveryAppBar_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryAppBar()
    }
}
