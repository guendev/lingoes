//
//  OverlookViewModel.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

class OverlookViewModel: ObservableObject {
    @Published var width: CGFloat = .zero
    @Published var offset: CGFloat = .zero
    @Published var avatarHeight: CGFloat = .zero
    
    @Published var levels: [Level] = []
    @Published var selectedLevels: [String] = []
    
    func getLevels() async  -> Void {
        levels = [
            Level(title: "Introducing", subtitle: "About user interface"),
            Level(title: "Theory", subtitle: "How to learn ui/ux design"),
            Level(title: "Clossing", subtitle: "Question and answer session")
        ]
    }
    
    func toggleLevel(_ level: String) -> Void {
        if selectedLevels.contains(level) {
            selectedLevels.removeAll { item in
                item == level
            }
        } else {
            selectedLevels.append(level)
        }
    }
}
