//
//  GameView.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                
                GameAppBar()
                    .padding([.horizontal, .bottom])
                
                ScrollView(showsIndicators: false) {
                    
                    GameImageText()
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .bottom) {
                    GameContinue()
                }
            }
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
