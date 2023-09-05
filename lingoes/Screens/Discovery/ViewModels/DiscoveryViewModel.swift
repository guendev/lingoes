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
}
