//
//  SettingsViewModel.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var offset: CGFloat = .zero
    @Published var appBarHeight: CGFloat = .zero
}
