//
//  ToastViewModel.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

class ToastViewModel: ObservableObject {
    @Published var toasts: [Toast] = []
    
    func add(message: String, status: ToastStatus = .success) {
        let toast = Toast(message: message, status: status)
        
        toasts.insert(toast, at: 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.toasts.removeLast()
        }
    }
}
