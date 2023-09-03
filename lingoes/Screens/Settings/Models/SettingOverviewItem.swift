//
//  SettingOverviewItem.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct SettingOverviewItem: Identifiable {
    var id: String = UUID().uuidString
    var icon: String
    var onClick: () -> Void
    var title: String
    var subtitle: String
    var backgroud: Color
}
