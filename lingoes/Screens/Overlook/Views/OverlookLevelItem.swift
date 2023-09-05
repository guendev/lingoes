//
//  OverlookLevelItem.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverlookLevelItem: View {
    var level: Level
    var spacing: CGFloat = 15

    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: OverlookViewModel
    
    @State var words: [String] = ["Apple", "Orange", "Mango", "Cherry"]
    

    var body: some View {
        VStack(spacing: spacing) {
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(level.title)
                    .font(.headline)
                    .fontWeight(isSelected() ? .medium : .regular)
                    .kerning(0.5)
                    .foregroundColor(isSelected() ? .white : Color("Text"))
                    .animation(.none, value: isSelected())
                
                Text(level.subtitle)
                    .font(.subheadline)
                    .foregroundColor(isSelected() ? .white.opacity(0.9) : Color("Text2"))
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(getBackground())
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 0)
            .onTapGesture {
                withAnimation {
                    viewModel.toggleLevel(level.id)
                }
            }
            
            
            if !isSelected() {
                VStack(alignment: .leading, spacing: spacing) {
                    
                    ForEach(words, id: \.self) { word in
                        OverlookWord(word: word)
                    }
                    
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    func getBackground() -> Color {
        if isSelected() {
            return .accentColor
        }
        return colorScheme == .light ? .white : Color("Background2")
    }
    
    func isSelected() -> Bool {
        viewModel.selectedLevels.contains(level.id)
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
