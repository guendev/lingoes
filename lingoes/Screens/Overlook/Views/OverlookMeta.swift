//
//  OverlookMeta.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverlookMeta: View {
    var body: some View {
        HStack(spacing: 30) {
            
            HStack(spacing: 4) {
                
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                
                Text("Guen")
                    .font(.callout)
                
            }
            
            HStack(spacing: 4) {
                
                Image(systemName: "pencil.and.outline")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                
                Text("160")
                    .font(.callout)
                
            }
            
            HStack(spacing: 4) {
                
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                
                Text("14h")
                    .font(.callout)
                
            }
            
        }
        .foregroundColor(Color("Text2"))
    }
}

struct OverlookMeta_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OverlookView()
                .environment(\.colorScheme, .light)
            
            OverlookView()
                .environment(\.colorScheme, .dark)
        }
    }
}
