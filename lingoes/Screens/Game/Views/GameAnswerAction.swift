//
//  GameAnswerAction.swift
//  lingoes
//
//  Created by Guen on 17/09/2023.
//

import SwiftUI

struct GameAnswerAction: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            Button {
                
                withAnimation {
                    viewModel.answerStatus = .incomplete
                }
                
            } label: {
                
                HStack {
                    
                    Image(systemName: "checkmark")
                    
                    Text("Pefect")
                    
                }
                
            }
            .buttonStyle(PrimaryButtonStyle(size: .lg))

        }
        .frame(maxHeight: .infinity)
        
    }
}

struct GameAnswerAction_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
