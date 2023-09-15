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
    
    
    var onCorrect: (_ answer: GamePickUpFromImagesItem) -> Void
    var onError: (_ selected: GamePickUpFromImagesItem, _ answer: GamePickUpFromImagesItem) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            SizeBox(height: 30)
            
            VStack(spacing: 5) {
                
                Text("Which is")
                    .font(.body)
                    .foregroundColor(Color("Text2"))
                
                Text("\"Apple\"")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
            }
            
            SizeBox(height: 30)
            
            LazyVGrid(columns: columns, spacing: 32) {
                ForEach(items) { answer in
                    
                    Sizeable { size in
                        
                        Button {
                            
                            selectAnswer(answer)
                            
                        } label: {
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: size.width, height: size.width)
                                .overlay {
                                    
                                    Image(answer.image)
                                        .resizable()
                                        .scaledToFit()
                                    
                                }
                                .opacity(getOpacity(answer))
                                .blur(radius: getBlur(answer))
                                .brightness(answer.id == selectedAnswer?.id ? -0.1 : 0)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        }
                        .buttonStyle(.plain)
                    }
                    
                }
            }
        }
    }
    
    func selectAnswer(_ answer: GamePickUpFromImagesItem) -> Void {
        if selectedAnswer != nil {
            return
        }
        withAnimation {
            selectedAnswer = answer
        }
        
        if selectedAnswer!.id == correctAnswer.id {
            onCorrect(correctAnswer)
        } else {
            onError(selectedAnswer!, correctAnswer)
        }
        
        // TODO: Add config
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            withAnimation {
                selectedAnswer = nil
            }
        }
    }
    
    func getOpacity(_ answer: GamePickUpFromImagesItem) -> CGFloat {
        if selectedAnswer == nil {
            return 1
        }
        return answer.id == selectedAnswer?.id ? 1 : 0.4
    }
    
    func getBlur(_ answer: GamePickUpFromImagesItem) -> CGFloat {
        if selectedAnswer == nil {
            return 0
        }
        return answer.id == selectedAnswer?.id ? 5 : 0
    }
}

struct GameImageText_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
