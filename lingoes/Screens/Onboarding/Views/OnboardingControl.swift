//
//  OnboardingControl.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct OnboardingControl: View {
    
    @EnvironmentObject var viewModel: OnBoardingViewModel
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 10) {
            
            ForEach(viewModel.tabs, id: \.self) { tab in
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: viewModel.currentTab == tab ? 16 : 8, height: 8)
                    .overlay {
                        
                        if viewModel.currentTab == tab {
                            
                            Capsule()
                                .fill(Color("AccentColor"))
                                .frame(width: 16, height: 8)
                                .matchedGeometryEffect(id: "OnBoardingTab", in: animation)
                            
                        }
                        
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            viewModel.currentTab = tab
                        }
                    }
            }
            
        }
    }
}

struct OnboardingControl_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
