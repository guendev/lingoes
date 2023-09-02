//
//  AuthSwitcher.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct AuthSwitcher: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            Text("\(viewModel.mode == .signUp ? "Don’t have" : "Have") an account? ")
                .font(.subheadline)
                .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
            
            + Text(viewModel.mode == .signIn ? "Register" : "Sign In")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.accentColor)
        }
        .onTapGesture {
            withAnimation {
                viewModel.mode = viewModel.mode == .signIn ? .signUp : .signIn
            }
        }
    }
}

struct AuthSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
