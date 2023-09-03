//
//  IconButton.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct IconButtonStyle: ButtonStyle {
    var size: CGFloat?
    var color: Color?
    var background: Color?
    var borderBorder: Color?
    
    func getSize() -> CGFloat {
        size ?? 38
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(color ?? Color("Text"))
            .frame(width: getSize(), height: getSize())
            .overlay {
                RoundedRectangle(cornerRadius: getSize())
                    .stroke(borderBorder ?? Color("Border"), lineWidth: 1)
            }
            .background {
                RoundedRectangle(cornerRadius: getSize())
                    .fill(background ?? .clear)
            }
    }
}
