//
//  DiscoveryViewModel.swift
//  lingoes
//
//  Created by Guen on 05/09/2023.
//

import SwiftUI

class DiscoveryViewModel: ObservableObject {
    
    @Published var keyword: String = ""
    @Published var showFilter: Bool = false
    
    @Published var categories: [Category] = [
        Category(
            name: "Toeic",
            items: [
                CategoryItem(name: "Toeic 1", color1: "#FFF6C3", color2: ""),
                CategoryItem(name: "Toeic 2", color1: "#FFF6C3", color2: ""),
                CategoryItem(name: "Toeic 3", color1: "#FFF6C3", color2: "")
            ]
        ),
        Category(
            name: "Ielts",
            items: [
                CategoryItem(name: "Ielts 1", color1: "#FFF6C3", color2: ""),
                CategoryItem(name: "Ielts 2", color1: "#FFF6C3", color2: ""),
                CategoryItem(name: "Ielts 3", color1: "#FFF6C3", color2: "")
            ]
        ),
        Category(
            name: "Doulingo",
            items: [
                CategoryItem(name: "Doulingo 1", color1: "#FFF6C3", color2: ""),
                CategoryItem(name: "Doulingo 2", color1: "#FFF6C3", color2: ""),
                CategoryItem(name: "Doulingo 3", color1: "#FFF6C3", color2: "")
            ]
        ),
        Category(
            name: "Toefl",
            items: [
                CategoryItem(name: "Toefl 1", color1: "#FFF6C3", color2: ""),
                CategoryItem(name: "Toefl 2", color1: "#FFF6C3", color2: ""),
                CategoryItem(name: "Toefl 3", color1: "#FFF6C3", color2: "")
            ]
        )
    ]
    
    func getCategories() async -> Void {
        //
    }
}
