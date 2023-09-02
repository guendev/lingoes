//
//  ButtonStyles.swift
//  lingoes
//
//  Created by Guen on 01/09/2023.
//

import SwiftUI

enum ButtonDesign {
    case solid, flat, border
}


enum ButtonSize {
    case sm, md, lg
}

enum ButtonShape{
    case rounded, circle, square
}

protocol ButtonProtocol {
    var color: Color {
        get
    }
    
    var size: ButtonSize {
        get
    }
    
    var block: Bool {
        get
    }
}

struct PrimaryButtonStyle: ButtonStyle, ButtonProtocol {
    var color: Color = .accentColor
    var size: ButtonSize = .md
    var block: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(getFont(size: size))
            .padding(getPadding(size: size))
            .frame(maxWidth: block ? .infinity : .none)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .shadow(color: color.opacity(0.5), radius: 20, x: 0, y: 10)
    }
}

struct BorderButtonStyle: ButtonStyle, ButtonProtocol {
    var color: Color = .accentColor
    var size: ButtonSize = .md
    var block: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(getFont(size: size))
            .padding(getPadding(size: size))
            .frame(maxWidth: block ? .infinity : .none)
            .foregroundColor(color)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(color, lineWidth: getBorderWidth(size: size))
                
            }
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}

private func getPadding(size: ButtonSize) -> EdgeInsets {
    switch size {
    case .lg:
        return EdgeInsets(top: 14, leading: 18, bottom: 14, trailing: 18)
    case .md:
        return EdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18)
    case .sm:
        return EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10)
    }
}

private func getFont(size: ButtonSize) -> Font {
    switch size {
    case .lg:
        return .system(size: 16, weight: .semibold)
    case .md:
        return .system(size: 14, weight: .medium)
    case .sm:
        return .system(size: 12, weight: .regular)
    }
}

private func getBorderWidth(size: ButtonSize) -> CGFloat {
    switch size {
    case .lg:
        return 3
    case .md, .sm:
        return 2
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button(action: {
                // Button action
            }) {
                Text("Custom Button")
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button(action: {
                // Button action
            }) {
                Text("Custom Button")
            }
            .buttonStyle(BorderButtonStyle())
        }
    }
}
