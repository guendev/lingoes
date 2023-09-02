//
//  AuthSocial.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct AuthSocial: View {
    
    var buttonStyle: BorderButtonStyle = BorderButtonStyle(
        textColor: Color(red: 0.09, green: 0.11, blue: 0.18),
        color: Color(red: 0.94, green: 0.94, blue: 0.98),
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
                    .frame(width: 36)
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
                    .frame(width: 36)
                    .offset(x: 7)

            }

            
        }
    }
}

struct AuthSocial_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
