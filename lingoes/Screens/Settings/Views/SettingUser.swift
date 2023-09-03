//
//  SettingUser.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct SettingUser: View {
    var body: some View {
        HStack(spacing: 16) {
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("Background2"))
                .frame(width: 56, height: 56)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text("Yudi Maulana Smith")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Text"))
                
                HStack(spacing: 5) {
                    
                    Text("Gold Member")
                        .font(.caption)
                        .fontWeight(.medium)
                    
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 10)
                    
                }
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 5)
                .background {
                    Rectangle()
                      .foregroundColor(.clear)
                      .background(Color.accentColor)
                      .cornerRadius(30)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Button {
        
                
            } label: {
                Image(systemName: "gear")
            }
            .buttonStyle(IconButtonStyle(borderBorder: .clear))
            
        }
    }
}

struct SettingUser_Previews: PreviewProvider {
    static var previews: some View {
        SettingUser()
    }
}
