//
//  MainTabItem.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct MainTabItem: Identifiable {
    var id: String = UUID().uuidString
    var tab: MainTab
    var icon: String
    var activeIcon: String
}
