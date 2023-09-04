//
//  OverlookLevelItem.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverlookLevelItem: View {
    var level: Level

    @Environment(\.colorScheme) var colorScheme
    @State var isChecked: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(level.title)
                .font(.headline)
                .fontWeight(.regular)
                .kerning(0.5)
                .foregroundColor(Color("Text"))
            
            Text(level.subtitle)
                .font(.subheadline)
                .foregroundColor(Color("Text2"))
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(colorScheme == .light ? .white : Color("Background2"))
        .cornerRadius(15)
        .shadow(color: Color(red: 0.02, green: 0.01, blue: 0.29).opacity(0.03), radius: 27, x: 10, y: 24)
        .overlay(alignment: .trailing) {
            
            Button {
                
                withAnimation {
                    isChecked.toggle()
                }
                
            } label: {
                
                Circle()
                    .fill(isChecked ? Color.accentColor : .clear)
                    .frame(width: 20, height: 20)
                    .cornerRadius(50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .inset(by: 0.5)
                            .stroke(isChecked ? Color.accentColor : Color("Text2").opacity(0.5), lineWidth: 1)
                    }
                    .overlay {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .foregroundColor(isChecked ? Color.white : .clear)
                            .scaleEffect(isChecked ? 1 : 0)
                    }
                    .offset(x: -20)
            }
            .buttonStyle(.plain)

            
        }
    }
}

struct OverlookLevelItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OverlookView()
                .environment(\.colorScheme, .light)
            
            OverlookView()
                .environment(\.colorScheme, .dark)
        }
    }
}
