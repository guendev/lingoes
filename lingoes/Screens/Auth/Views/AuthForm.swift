//
//  AuthForm.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct AuthForm: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack(spacing: 0){
            
            if viewModel.mode == .signUp {
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Name")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
                                        
                    TextField(text: $viewModel.name) {
                        Text("Enter your name")
                            .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 15)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(26)
                    
                }
                
                SizeBox(height: 30)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Email or Phone Number")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
                                    
                TextField(text: $viewModel.email) {
                    Text("Enter your email")
                        .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 15)
                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                .cornerRadius(26)
                
            }
            
            SizeBox(height: 30)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Password")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
                                    
                Group {
                    if viewModel.isShowPassword {
                        
                        TextField(text: $viewModel.password) {
                            Text("Enter your password")
                                .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
                        }
                        
                    } else {
                        SecureField(text: $viewModel.password) {
                            Text("Enter your password")
                                .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 15)
                .padding(.trailing, 40)
                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                .cornerRadius(26)
                .overlay(alignment: .trailing) {
                    
                    Button {
                        
                        withAnimation {
                            viewModel.isShowPassword.toggle()
                        }
                        
                    } label: {
                        Image(systemName: viewModel.isShowPassword ? "eye.slash" : "eye")
                            .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
                    }
                    .buttonStyle(.plain)
                    .padding(.trailing)
                    
                }
                
            }
            
            SizeBox(height: 60)
            
            
            Button {
                
            } label: {
                
                Text(viewModel.mode == .signIn ? "Sign In" : "Sign Up")
                
            }
            .buttonStyle(PrimaryButtonStyle(size: .lg, block: true))
        }
    }
}

struct AuthForm_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
