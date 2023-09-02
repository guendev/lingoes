//
//  AuthViewModel.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var rePassword: String = ""
    
}
