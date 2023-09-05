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
    
    var shape: ButtonShape {
        get
    }
}

struct PrimaryButtonStyle: ButtonStyle, ButtonProtocol {
    var color: Color = .accentColor
    var size: ButtonSize = .md
    var shape: ButtonShape = .circle
    var block: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(getFont(size: size))
            .padding(getPadding(size: size))
            .frame(maxWidth: block ? .infinity : .none)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(getRadius(shape: shape))
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .shadow(color: color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct BorderButtonStyle: ButtonStyle, ButtonProtocol {
    var textColor: Color?
    var color: Color = .accentColor
    var size: ButtonSize = .md
    var shape: ButtonShape = .circle
    var block: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(getFont(size: size))
            .padding(getPadding(size: size))
            .frame(maxWidth: block ? .infinity : .none)
            .foregroundColor(textColor ?? color)
            .overlay {
                RoundedRectangle(cornerRadius: getRadius(shape: shape))
                    .stroke(color, lineWidth: getBorderWidth(size: size))
                
            }
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}

private func getPadding(size: ButtonSize) -> EdgeInsets {
    switch size {
    case .lg:
        return EdgeInsets(top: 16, leading: 18, bottom: 16, trailing: 18)
    case .md:
        return EdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18)
    case .sm:
        return EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10)
    }
}

private func getFont(size: ButtonSize) -> Font {
    switch size {
    case .lg:
        return .subheadline.weight(.semibold)
    case .md:
        return .subheadline.weight(.semibold)
    case .sm:
        return .subheadline.weight(.semibold)
    }
}

private func getBorderWidth(size: ButtonSize) -> CGFloat {
    switch size {
    case .lg:
        return 2
    case .md, .sm:
        return 1
    }
}

private func getRadius(shape: ButtonShape) -> CGFloat {
    switch shape {
    case .square:
        return 0
    case .circle:
        return 9999
    default:
        return 12
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
