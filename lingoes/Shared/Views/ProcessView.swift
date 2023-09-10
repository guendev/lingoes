//
//  ProcessView.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct ProcessView: View {
    @State var process: Double
    
    var body: some View {
        
        Sizeable { size in
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("Background2"))
                .overlay(alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.accentColor)
                        .frame(width: CGFloat(process) * size.width)
                    
                }
        }
    }
}

struct ProcessView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelper {
            GameView()
        }
    }
}
