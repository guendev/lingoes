//
//  AnalyticView.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct AnalyticView: View {
    var body: some View {
        ZStack {
            
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
            }
            
        }
    }
}

struct AnalyticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
