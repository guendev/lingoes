//
//  MainView.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel = .init()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            TabView(selection: $viewModel.currentTab) {
                
                DashboardView()
                    .tag(MainTab.dashboard)
                
//                AnalyticView()
//                    .tag(MainTab.overview)
                
                DiscoveryView()
                    .tag(MainTab.discovery)
                
                SettingsView()
                    .tag(MainTab.settings)
                
            }
            
            MainTabView()
            
        }
        .environmentObject(viewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            MainView()
        }
    }
}
