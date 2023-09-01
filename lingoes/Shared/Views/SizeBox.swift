//
//  SizeBox.swift
//  lingoes
//
//  Created by Guen on 01/09/2023.
//

import SwiftUI

struct SizeBox: View {
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        Color.clear
            .frame(width: width ?? 0, height: height ?? 0)
    }
}
