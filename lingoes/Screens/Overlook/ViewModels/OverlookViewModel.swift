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
}
