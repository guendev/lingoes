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
        MainTabItem(tab: .overview, icon: "Home", activeIcon: "HomeBold"),
        MainTabItem(tab: .vocabularies, icon: "Chart", activeIcon: "ChartBold"),
        MainTabItem(tab: .discovery, icon: "Search", activeIcon: "SearchBold"),
        MainTabItem(tab: .settings, icon: "Profile", activeIcon: "ProfileBold")
    ]
    
    var body: some View {
        HStack {
            ForEach(tabs) { tab in
                
                Button {
                    
                    withAnimation(.easeInOut(duration: 0.2)) {
                        viewModel.currentTab = tab.tab
                    }
                    
                } label: {
                    
                    Image(viewModel.currentTab == tab.tab ? tab.activeIcon : tab.icon)
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
        .background {
            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
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
