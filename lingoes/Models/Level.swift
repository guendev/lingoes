//
//  Level.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct Level: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var subtitle: String
}
