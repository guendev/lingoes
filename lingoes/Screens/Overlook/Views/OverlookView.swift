//
//  OverlookView.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct OverlookView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            AppBar {
                
                dismiss()
                
            } content : {
                Text("Detail")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
            }
            
            SizeBox(height: 30)
            
            ScrollView(showsIndicators: false) {
            }
            
        }
        .background {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct OverlookView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OverlookView()
                .environment(\.colorScheme, .light)
            
            OverlookView()
                .environment(\.colorScheme, .dark)
        }
    }
}
