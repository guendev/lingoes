//
//  Category.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI
struct Category: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var items: [CategoryItem]
}

struct CategoryItem: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var color1: String
    var color2: String
}
