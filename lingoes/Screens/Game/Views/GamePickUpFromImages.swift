//
//  GameImageText.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct GamePickUpFromImagesItem: Identifiable {
    var id: String = UUID().uuidString
    var image: String
}

struct GamePickUpFromImages: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(maximum: 120), spacing: 32),
        GridItem(.flexible(maximum: 120), spacing: 32)
    ]
    
    var items: [GamePickUpFromImagesItem] = [
        GamePickUpFromImagesItem(id: "1", image: "avatar"),
        GamePickUpFromImagesItem(id: "2", image: "avatar"),
        GamePickUpFromImagesItem(id: "3", image: "avatar"),
        GamePickUpFromImagesItem(id: "4", image: "avatar")
    ]
    var correctAnswer = GamePickUpFromImagesItem(id: "1", image: "avatar")
    
    @State var selectedAnswer: GamePickUpFromImagesItem?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Which is the correct IMAGE?")
                .font(.body)
                .foregroundColor(Color("Text2"))
            
            SizeBox(height: 20)
            
            Sizeable { size in
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("Background2"))
                    .frame(width: size.width, height: size.width)
                    .overlay {
                        
                        Image(correctAnswer.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }
                    .overlay {
                        
                        if selectedAnswer == nil {
                            ZStack {
                                
                                Color.clear
                                    .background(.ultraThinMaterial)
                                
                                Text("Apple")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                            }
                        }
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .frame(maxWidth: 120 * 2 + 32)
            
            
            if selectedAnswer == nil {
                LazyVGrid(columns: columns, spacing: 32) {
                    ForEach(items) { answer in
                        
                        Sizeable { size in
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("Background2"))
                                .frame(width: size.width, height: size.width)
                                .overlay {
                                    
                                    Image(answer.image)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                    
                                }
                                .onTapGesture {
                                    selectAnswer(answer)
                                }
                        }
                        
                    }
                }
                .padding(.top, 30)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    func selectAnswer(_ answer: GamePickUpFromImagesItem) -> Void {
        withAnimation {
            selectedAnswer = answer
        }
        
        if selectedAnswer!.id == correctAnswer.id {
            
            withAnimation {
                viewModel.exp += 10
                
                viewModel.answerStatus = .correct
            }
            
        } else {
            withAnimation {
                viewModel.answerStatus = .error
            }
        }
    }
}

struct GameImageText_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
