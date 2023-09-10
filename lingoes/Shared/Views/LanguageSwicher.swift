//
//  LanguageSwicher.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct LanguageSwicher: View {
    var body: some View {
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

struct LanguageSwicher_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSwicher()
    }
}
