//
//  MainViewModel.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var currentTab: MainTab = .dashboard
}
