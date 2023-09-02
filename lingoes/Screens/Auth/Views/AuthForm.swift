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
    @EnvironmentObject var toastViewModel: ToastViewModel
    
    @FocusState var focus: AuthFocusableField?
    
    func submit() async -> Void {
        if viewModel.isLoading {
            return
        }
        
        do {
            let user = try await viewModel.submit()
                        
            if let user = user {
                // Success
                print(user)
                toastViewModel.add(message: "Your login request successfull")
            }
            
        } catch {
            toastViewModel.add(message: error.localizedDescription, status: .error)
        }
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
                    .submitLabel(.next)
                    .focused($focus, equals: .name)
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
                .submitLabel(.next)
                .focused($focus, equals: .email)
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 16)
                .padding(.vertical, 15)
                .background(Color("Background2"))
                .cornerRadius(26)
                            
                if !viewModel.errorEmail.isEmpty {
                    Text(viewModel.errorEmail)
                        .font(.footnote)
                        .foregroundColor(Color("Danger"))
                }
                
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
                .focused($focus, equals: .password)
                .submitLabel(.continue)
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
                
                if !viewModel.errorPassword.isEmpty {
                    Text(viewModel.errorPassword)
                        .font(.footnote)
                        .foregroundColor(Color("Danger"))
                }
                
            }
            
            SizeBox(height: 60)
            
            
            Button {
                                
                Task {
                    await submit()
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
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
