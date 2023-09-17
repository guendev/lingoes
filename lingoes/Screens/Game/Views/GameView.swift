//
//  GameView.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel: GameViewModel = .init()
    
    var body: some View {
        ZStack {
            
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                                    
                GameAppBar()
                    .padding([.bottom])
                    .sizeDetector(height: $viewModel.appBarHeight)
                
                Group {
                    
                    GamePickUpFromImages()
                    
                }
                .sizeDetector(height: $viewModel.gameHight)
            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity, alignment: .top)
            .overlay(alignment: .bottom) {
                if viewModel.answerStatus == .next {
                    GameContinue()
                }
            }
            
        }
        .environmentObject(viewModel)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
