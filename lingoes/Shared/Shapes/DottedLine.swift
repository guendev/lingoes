//
//  DottedLine.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct DottedLine: Shape {
        
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}

struct TestDottedLineView: View {
    var body: some View {
        DottedLine()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
            .frame(width: 1, height: 100)
            .foregroundColor(Color.red)
    }
}
