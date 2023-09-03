//
//  MainTabView.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var tabs: [MainTabItem] = [
        MainTabItem(tab: .overview, icon: "house", activeIcon: "house.fill"),
        MainTabItem(tab: .vocabularies, icon: "paperplane", activeIcon: "paperplane.fill"),
        MainTabItem(tab: .cources, icon: "command", activeIcon: "command"),
        MainTabItem(tab: .settings, icon: "person", activeIcon: "person.fill")
    ]
    
    var body: some View {
        HStack {
            ForEach(tabs) { tab in
                
                Button {
                    
                    withAnimation(.easeInOut(duration: 0.2)) {
                        viewModel.currentTab = tab.tab
                    }
                    
                } label: {
                    
                    Image(systemName: viewModel.currentTab == tab.tab ? tab.activeIcon : tab.icon)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(viewModel.currentTab == tab.tab ? .accentColor : .gray)
                        .padding(.top)
                    
                }
                
            }
        }
        .overlay(alignment: .top) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("Border"))
                .padding(.top, -1)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
