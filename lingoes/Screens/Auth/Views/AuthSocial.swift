//
//  AuthSocial.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct AuthSocial: View {
    
    var buttonStyle: BorderButtonStyle = BorderButtonStyle(
        textColor: Color("Text"),
        color: Color("Border"),
        size: .lg,
        block: true
    )
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button {
                
            } label: {
                Text("Sign In With Google")
            }
            .buttonStyle(buttonStyle)
            .overlay(alignment: .leading) {
                
                Image("google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32)
                    .offset(x: 7)
                
            }
            
            Button {
                
            } label: {
                Text("Sign In With Facebook")
            }
            .buttonStyle(buttonStyle)
            .overlay(alignment: .leading) {
                
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32)
                    .offset(x: 7)

            }

            
        }
    }
}

struct AuthSocial_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView()
                .environment(\.colorScheme, .light)
            
            AuthView()
                .environment(\.colorScheme, .dark)
        }
    }
}
