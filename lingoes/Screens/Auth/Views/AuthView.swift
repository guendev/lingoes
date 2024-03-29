//
//  LoginView.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var viewModel: AuthViewModel = .init()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            AppBar {
                
                dismiss()
                
            } content : {
                Text("Login")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
            }
            
            SizeBox(height: 30)
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 0) {
                    
                    AuthForm()
                    
                    SizeBox(height: 40)
                    
                    Text("Or using other method")
                        .font(.subheadline)
                        .foregroundColor(Color("Text2"))
                    
                    SizeBox(height: 40)

                    AuthSocial()
                    
                }
                .padding(.horizontal)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            SizeBox(height: 30)
            
            AuthSwitcher()
        
        }
        .background {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
        }
        .environmentObject(viewModel)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
