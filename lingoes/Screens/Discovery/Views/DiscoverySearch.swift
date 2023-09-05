//
//  DiscoverySearch.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct DiscoverySearch: View {
    
    @EnvironmentObject var viewModel: DiscoveryViewModel
    
    var body: some View {
        HStack {
            
            TextField(text: $viewModel.keyword) {
                Text("Search package")
                    .foregroundColor(Color("Text2"))
            }
            .submitLabel(.search)
            .textInputAutocapitalization(.never)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .padding(.trailing, 40)
            .background(Color("Background2"))
            .cornerRadius(26)
            .overlay(alignment: .trailing) {
                
                Button {
                    
                    withAnimation {
                        // viewModel.isShowPassword.toggle()
                    }
                    
                } label: {
                    Image("FilterCurved")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("Text2"))
                        .frame(height: 24)
                }
                .buttonStyle(.plain)
                .offset(x: -14)
            }

        }
    }
}

struct DiscoverySearch_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
