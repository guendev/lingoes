//
//  SettingsView.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                LinearGradient(colors: [Color.accentColor.opacity(0.4), Color.clear], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 250)
                
                Spacer()
            }
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 0) {
                    
                    SettingUser()
                    
                    SizeBox(height: 40)
                    
                    SettingsOverview()
                    
                }
                .padding(.horizontal)
                
            }
        }
    }
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
