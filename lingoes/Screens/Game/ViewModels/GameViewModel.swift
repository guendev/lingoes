//
//  GameViewModel.swift
//  lingoes
//
//  Created by Guen on 17/09/2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published var viewSize: CGSize = .init()
    
    @Published var appBarHeight: CGFloat = .zero
    @Published var gameHight: CGFloat = .zero
    
    @Published var answerStatus: GameAnswerStatus = .incomplete
    
    @Published var exp: Int = .zero
}
