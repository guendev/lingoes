//
//  OverviewWord.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverlookWord: View {
    var word: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            HStack {
                Text(word)
                    .font(.callout)
                    .foregroundColor(Color("Text"))
                    .padding(.trailing)
            }
            .padding(.horizontal)
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(colorScheme == .light ? .white : Color("Background2"))
            
            HStack {
                
                Spacer()
                
                HStack(spacing: 30) {
                    Button {
                        
                    } label: {
                        Image(systemName: "eye")
                            .font(.body)
                            .foregroundColor(Color("Text"))
                    }
                    .buttonStyle(.plain)
                    
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .font(.body)
                            .foregroundColor(Color("Text"))
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "info")
                            .font(.body)
                            .foregroundColor(Color("Text"))
                    }
                    .buttonStyle(.plain)
                    
                }
                .padding(.horizontal)
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(colorScheme == .light ? .white : Color("Background2"))
        .cornerRadius(15)
        .shadow(color: Color(red: 0.02, green: 0.01, blue: 0.29).opacity(0.03), radius: 27, x: 10, y: 24)
    }
}

struct OverviewWord_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OverlookView()
                .environment(\.colorScheme, .light)
            
            OverlookView()
                .environment(\.colorScheme, .dark)
        }
    }
}
