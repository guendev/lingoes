//
//  LoginView.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var viewModel: AuthViewModel = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .frame(width: 42, height: 42)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 0.94, green: 0.94, blue: 0.98), lineWidth: 1)
                        }
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "flag")
                        .frame(width: 42, height: 42)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 0.94, green: 0.94, blue: 0.98), lineWidth: 1)
                        }
                }
                .buttonStyle(.plain)
                
            }
            .padding(.horizontal)
            .overlay {
                Text("Login")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
            }
            
            SizeBox(height: 30)
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 30) {
                    
                    InputView (
                        value: $viewModel.email,
                        label: "Email or Phone Number",
                        placeholder: "Enter your email"
                    )
                    
                    InputView(
                        value: $viewModel.password,
                        label: "Password",
                        placeholder: "Enter your password"
                    )
                    
                }
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            SizeBox(height: 30)
            
            Text("Don’t have an account? ")
                .font(.subheadline)
                .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
            
            + Text("Register")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.accentColor)
        
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
