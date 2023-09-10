//
//  GameContinue.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct GameContinue: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                
                Text("CONTINUE")
                
            }
            .buttonStyle(PrimaryButtonStyle(size: .lg, block: true))
        }
        .padding(.all)
        .background {
            Color("Background")
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct GameContinue_Previews: PreviewProvider {
    static var previews: some View {
        GameContinue()
    }
}
