//
//  DiscoveryView.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

struct DiscoveryView: View {
    var body: some View {
        ZStack {
            
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                
                DiscoveryAppBar()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                ScrollView(showsIndicators: false) {
                    
                    VStack {
                        DiscoverySearch()
                    }
                    
                }
                
            }
            
        }
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
