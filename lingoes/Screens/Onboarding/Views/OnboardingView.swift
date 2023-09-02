//
//  OnboardingView.swift
//  lingoes
//
//  Created by Guen on 01/09/2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject var viewModel: OnBoardingViewModel = .init()
    @State var isShowAuth: Bool = false
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Spacer()
                
                SizeBox(height: 25)
                
                // Display xs/Semibold
                Text("Discover Event Near By You")
                    .font(
                        Font.custom("Poppins", size: 22)
                            .weight(.semibold)
                    )
                    .foregroundColor(.white)
                
                SizeBox(height: 12)
                
                // Text md/Regular
                Text("Vel ut nunc a sodales tellus nisl. Bibendum arcu feugiat in aenean ultricies ac vulputate.")
                    .font(Font.custom("Poppins", size: 14))
                    .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
                
                SizeBox(height: 40)
                
                HStack(spacing: 15) {
                    
                    OnboardingControl()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                        isShowAuth.toggle()
                        
                    } label: {
                        Text("Sign In")
                    }
                    .buttonStyle(PrimaryButtonStyle(size: .lg, block: true))
                    .frame(maxWidth: .infinity)
                    .fullScreenCover(isPresented: $isShowAuth) {
                        AuthView()
                    }
                    
                }
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .environmentObject(viewModel)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
