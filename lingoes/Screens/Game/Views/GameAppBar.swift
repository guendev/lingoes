//
//  GameAppBar.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct GameAppBar: View {
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                
                Button {
            
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("Text2"))
                        .frame(width: 32, height: 32)
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Text("36")
                        .font(.footnote)
                        .fontWeight(.medium)
                    
                    Image(systemName: "camera.macro")
                        .font(.caption)
                }
                .foregroundColor(.accentColor)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background {
                    Color.accentColor
                        .opacity(0.1)
                }
                .cornerRadius(10)
            }
            
            ProcessView(process: 0.5)
                .frame(height: 10)
            
        }
    }
}

struct GameAppBar_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
