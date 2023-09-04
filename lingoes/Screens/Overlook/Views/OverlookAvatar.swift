//
//  OverlookAvatar.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverlookAvatar: View {
    var body: some View {
        VStack(spacing: 0) {
            
            SizeBox(height: 30)
            
            HStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Spacer()
            }
            
            SizeBox(height: 20)
            
            Text("Design Talk: UI/UX Sharing Session")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color("Text"))
                .lineLimit(3)
                .multilineTextAlignment(.center)
        }
    }
}

struct OverlookAvatar_Previews: PreviewProvider {
    static var previews: some View {
        OverlookAvatar()
    }
}
