//
//  SettingsView.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel = .init()
    
    var body: some View {
        ZStack {
            
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                LinearGradient(colors: [Color.accentColor.opacity(0.4), Color.clear], startPoint: .top, endPoint: .bottom)
                    .frame(height: 250)
                    .edgesIgnoringSafeArea(.top)


                
                Spacer()
            }
            
            ScrollView(showsIndicators: false) {
                
                ZStack {
                    
                    VStack(spacing: 0) {
                        
                        SizeBox(height: viewModel.appBarHeight)
                        
                        SizeBox(height: 40)
                                                
                        SettingsOverview()
                        
                        SizeBox(height: 30)
                        
                        SettingsMenu()
                        
                    }
                    .padding(.horizontal)
                    
                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .named("scroll")).minY
                        Color.clear
                            .onChange(of: offset) { newValue in
                                viewModel.offset = newValue
                            }
                    }
                }
                
            }
            .coordinateSpace(name: "scroll")
            .overlay(alignment: .top) {
                SettingUser()
                    .padding(.horizontal)
                    .sizeDetector(height: $viewModel.appBarHeight)
                    .padding(.bottom)
                    .background {
                        
                        Color("Background")
                            .ignoresSafeArea()
                            .opacity(-viewModel.offset / viewModel.appBarHeight)
                        
                    }
            }
        }
    }
}

private struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
