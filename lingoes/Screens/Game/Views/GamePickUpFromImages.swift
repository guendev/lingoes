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
    
    var items: [GamePickUpFromImagesItem] = [
        GamePickUpFromImagesItem(id: "1", image: "avatar"),
        GamePickUpFromImagesItem(id: "2", image: "avatar"),
        GamePickUpFromImagesItem(id: "3", image: "avatar"),
        GamePickUpFromImagesItem(id: "4", image: "avatar")
    ]
    var correctId: String = "1"
    
    let columns: [GridItem] = [
        GridItem(.flexible(maximum: 120), spacing: 32),
        GridItem(.flexible(maximum: 120), spacing: 32)
    ]
    
    @State var selectedId: String = ""
    
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
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        }
                        .buttonStyle(.plain)
                        .opacity(getOpacity(answer))
                        .blur(radius: getBlur(answer))
                        .brightness(answer.id == selectedId ? -0.1 : 0)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }
                    
                }
            }
            
            Text(selectedId)
        }
    }
    
    func selectAnswer(_ answer: GamePickUpFromImagesItem) -> Void {
        if selectedId.isEmpty {
            withAnimation {
                selectedId = answer.id
            }
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                withAnimation {
                    selectedId = ""
                }
            }
        }
    }
    
    func getOpacity(_ answer: GamePickUpFromImagesItem) -> CGFloat {
        if selectedId.isEmpty {
            return 1
        }
        return answer.id == selectedId ? 1 : 0.4
    }
    
    func getBlur(_ answer: GamePickUpFromImagesItem) -> CGFloat {
        if selectedId.isEmpty {
            return 0
        }
        return answer.id == selectedId ? 5 : 0
    }
}

extension GamePickUpFromImages {
    
}

struct GameImageText_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
