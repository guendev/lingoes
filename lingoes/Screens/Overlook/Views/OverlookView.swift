//
//  OverlookView.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct OverlookView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: OverlookViewModel = .init()
    
    var body: some View {
        
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                AppBar {
                    
                } content : {
                    ZStack {
                        
                        Text("Detail")
                            .offset(y: abs(viewModel.offset) < viewModel.avatarHeight ? 0 : -25)
                            .opacity(abs(viewModel.offset) < viewModel.avatarHeight ? 1 : 0)
                        
                        Text("Design Talk: UI/UX Sharing Session")
                            .offset(y: abs(viewModel.offset) >= viewModel.avatarHeight ? 0 : 25)
                            .opacity(abs(viewModel.offset) >= viewModel.avatarHeight ? 1 : 0)
                        
                    }
                    .animation(.default, value: viewModel.offset)
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundColor(Color("Text"))
                    .clipped()
                }
                            
                ScrollView(showsIndicators: false) {
                    ZStack {
                        
                        ScrollOffserListener { offset in
                            viewModel.offset = offset
                        }
                        
                        
                        VStack(spacing: 0) {
                            
                            OverlookAvatar()
                                .frame(width: viewModel.width * 0.75)
                                .frame(maxWidth: .infinity)
                                .sizeDetector(height: $viewModel.avatarHeight)
                            
                            SizeBox(height: 20)
                            
                            OverlookMeta()
                            
                            SizeBox(height: 40)
                            
                            OverDescription()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .coordinateSpace(name: "scroll")
                .frame(maxWidth: .infinity, alignment: .leading)
                
                OverlookFriends()
                
            }
        }
        .sizeDetector(width: $viewModel.width)
    }
}

struct OverlookView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OverlookView()
                .environment(\.colorScheme, .light)
            
            OverlookView()
                .environment(\.colorScheme, .dark)
        }
    }
}
