//
//  DashboardView.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                DashboardAppBar()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                ScrollView(showsIndicators: false) {

                    VStack {
                        
                        DashboardOverview()
                        
                    }
                    
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            MainView()
        }
    }
}
