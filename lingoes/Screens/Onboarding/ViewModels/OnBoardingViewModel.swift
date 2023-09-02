//
//  OnBoardingViewModel.swift
//  lingoes
//
//  Created by Guen on 01/09/2023.
//

import SwiftUI

class OnBoardingViewModel: ObservableObject {
    var tabs: [Int] = [1, 2, 3, 4]

    @Published var currentTab: Int = 1
}
