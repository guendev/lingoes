//
//  AuthForm.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI
import FirebaseAuth

struct AuthForm: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    func signIn() async -> Void {
        viewModel.isLoading.toggle()
        do {
            let authDataResult = try await Auth.auth().createUser(withEmail: viewModel.email, password: viewModel.password)
            print(authDataResult.user)
        } catch {
            print(error)
        }
        viewModel.isLoading.toggle()
    }
    
    func signUp() async  -> Void {
        viewModel.isLoading.toggle()
        do {
            
            let authDataResult = try await Auth.auth().signIn(withEmail: viewModel.email, password: viewModel.password)

        } catch {
            print(error)
        }
        viewModel.isLoading.toggle()
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            if viewModel.mode == .signUp {
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Name")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Text"))
                                        
                    TextField(text: $viewModel.name) {
                        Text("Enter your name")
                            .foregroundColor(Color("Text2"))
                    }
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 15)
                    .background(Color("Background2"))
                    .cornerRadius(26)
                    
                }
                
                SizeBox(height: 30)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Email or Phone Number")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                                    
                TextField(text: $viewModel.email) {
                    Text("Enter your email")
                        .foregroundColor(Color("Text2"))
                }
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 16)
                .padding(.vertical, 15)
                .background(Color("Background2"))
                .cornerRadius(26)
                
            }
            
            SizeBox(height: 30)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Password")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                                    
                Group {
                    if viewModel.isShowPassword {
                        
                        TextField(text: $viewModel.password) {
                            Text("Enter your password")
                                .foregroundColor(Color("Text2"))
                        }
                        
                    } else {
                        SecureField(text: $viewModel.password) {
                            Text("Enter your password")
                                .foregroundColor(Color("Text2"))
                        }
                    }
                    
                }
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 16)
                .padding(.vertical, 15)
                .padding(.trailing, 40)
                .background(Color("Background2"))
                .cornerRadius(26)
                .overlay(alignment: .trailing) {
                    
                    Button {
                        
                        withAnimation {
                            viewModel.isShowPassword.toggle()
                        }
                        
                    } label: {
                        Image(systemName: viewModel.isShowPassword ? "eye.slash" : "eye")
                            .foregroundColor(Color("Text2"))
                    }
                    .buttonStyle(.plain)
                    .padding(.trailing)
                    
                }
                
            }
            
            SizeBox(height: 60)
            
            
            Button {
                
                print("0")
                
                Task {
                    print("1")
                    if !viewModel.isLoading {
                        if viewModel.mode == .signIn {
                            print("2")
                            await signIn()
                        } else {
                            await signUp()
                        }
                    }
                }
                
            } label: {
                
                Text(viewModel.mode == .signIn ? "Sign In" : "Sign Up")
                
            }
            .buttonStyle(PrimaryButtonStyle(size: .lg, block: true))
            .opacity(viewModel.isLoading ? 0.7 : 1)
        }
    }
}

struct AuthForm_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView()
                .environment(\.colorScheme, .light)
            
            AuthView()
                .environment(\.colorScheme, .dark)
        }
    }
}
