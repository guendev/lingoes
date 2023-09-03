//
//  SettingMenuItem.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct SettingMenuItem: Identifiable {
    var id: String = UUID().uuidString
    var icon: String
    var label: String
    var onClick: () -> Void
}
