//
//  AuthViewModel.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var mode: AuthMode = .signIn
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isShowPassword: Bool = false
    
    @Published var isLoading: Bool = false
    
}
