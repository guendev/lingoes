//
//  AuthViewModel.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI
import FirebaseAuth

@MainActor class AuthViewModel: ObservableObject {
    
    @Published var mode: AuthMode = .signIn
    
    @Published var name: String = ""
    @Published var email: String = "heloo@guen.dev"
    @Published var password: String = "Khoi@025"
    
    @Published var errorEmail: String = ""
    @Published var errorPassword: String = ""
    
    @Published var isShowPassword: Bool = false
    @Published var isLoading: Bool = false
    
    
    func validate() -> Bool {
        var isValid = true
        
        // Validate email
        if email.isEmpty {
            errorEmail = "Email is required"
            isValid = false
        } else if !isValidEmail(email) {
            errorEmail = "Invalid email format"
            isValid = false
        } else {
            errorEmail = ""
        }
        
        // Validate password
        if password.isEmpty {
            errorPassword = "Password is required"
            isValid = false
        } else if password.count < 6 {
            errorPassword = "Password must be at least 6 characters"
            isValid = false
        } else {
            errorPassword = ""
        }
        
        return isValid
    }

    private func isValidEmail(_ email: String) -> Bool {
        // Implement your email validation logic here
        // You can use regular expressions or any other method
        // This is just a basic example
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    func signIn() async throws -> User? {
        do {
            let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
            return authDataResult.user
        } catch {
            throw error
        }
    }

    func signUp() async throws -> User? {
        do {
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            return authDataResult.user
        } catch {
            throw error
        }
    }

    func submit() async throws -> User? {
        if validate() {
            isLoading = true
            
            if mode == .signIn {
                do {
                    let user = try await signIn()
                    isLoading = false
                    return user
                } catch {
                    isLoading = false
                    throw error
                }
            } else {
                do {
                    let user = try await signUp()
                    isLoading = false
                    return user
                } catch {
                    isLoading = false
                    throw error
                }
            }
        }
        
        return nil
    }
}


enum AuthError: Error {
    case unknown
}
