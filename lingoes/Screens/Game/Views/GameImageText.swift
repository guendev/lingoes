//
//  GameImageText.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct GameImageText: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(maximum: 120), spacing: 32),
        GridItem(.flexible(maximum: 120), spacing: 32) // Set a different spacing value for the Y axis
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            SizeBox(height: 30)
            
            VStack(spacing: 5) {
                
                Text("What is")
                    .font(.body)
                    .foregroundColor(Color("Text2"))
                
                Text("\"Apple\"")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
            }
            
            SizeBox(height: 30)
            
            LazyVGrid(columns: columns, spacing: 32) {
                ForEach(0..<4) { index in
                    
                    Sizeable { size in
                        
                        Button {
                            
                        } label: {
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: size.width, height: size.width)
                                .overlay {
                                    
                                    Image("avatar")
                                        .resizable()
                                        .scaledToFit()
                                    
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        }
                        .buttonStyle(.plain)

                        
                    }
                    
                }
            }
        }
    }
}

extension GameImageText {
    
}

struct GameImageText_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
