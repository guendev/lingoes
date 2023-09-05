//
//  OverviewWord.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI
import SwipeActions
import NativePartialSheet

struct OverlookWord: View {
    var word: String
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var actionWidth: CGFloat = .zero
    
    @State var showExplainSheet = false
    
    var body: some View {
        SwipeView {
            
            Button {
                
                withAnimation {
                    showExplainSheet.toggle()
                }
                
            } label: {
                
                Text(word)
                    .font(.callout)
                    .foregroundColor(Color("Text"))
                    .padding(.horizontal)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(colorScheme == .light ? .white : Color("Background2"))
                    .cornerRadius(15)
                    .shadow(color: Color(red: 0.02, green: 0.01, blue: 0.29).opacity(0.03), radius: 27, x: 10, y: 24)
            }
            .contentShape(Rectangle())
            .sheet(isPresented: $showExplainSheet) {
                ZStack {
                                    
                    Color("Background")
                        .edgesIgnoringSafeArea(.all)
                    
                }
                .environment(\.colorScheme, colorScheme)
            }
            .presentationDetents([ .medium ])
            .cornerRadius(32)
            .presentationDragIndicator(.visible)
            
            
        } trailingActions: { _ in
            SwipeAction {
                
            } label: { context in
                
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
                .padding(.horizontal, 30)
                .sizeDetector(width: $actionWidth)
                
            } background: { active in
                RoundedRectangle(cornerRadius: 15)
                    .fill(colorScheme == .light ? .white : Color("Background2"))
                    .shadow(color: Color(red: 0.02, green: 0.01, blue: 0.29).opacity(0.03), radius: 27, x: 10, y: 24)
            }
            
        }
        .swipeActionCornerRadius(0)
        .swipeActionsMaskCornerRadius(0)
        .swipeActionWidth(actionWidth)
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
