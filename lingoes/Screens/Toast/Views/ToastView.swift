//
//  ToastView.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct ToastView: View {
    @EnvironmentObject var toastViewModel: ToastViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                ForEach(toastViewModel.toasts, id: \.message) { toast in
                    HStack(alignment: .center, spacing: 10) {
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 18, height: 18)
                            .overlay {
                                
                                Image(systemName: toast.status == .success ? "checkmark" : "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color("Success"))
                                    .frame(width: 10, height: 10)
                                
                            }
                        
                        Text(toast.message)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding(12)
                    .background(Color("Slate"))
                    .cornerRadius(50)
                    .shadow(color: Color("Slate").opacity(0.2), radius: 7.5, x: 0, y: 4)
                }
            }
            .animation(.default, value: toastViewModel.toasts.count)
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
