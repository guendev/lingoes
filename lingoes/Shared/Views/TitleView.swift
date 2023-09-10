//
//  TitleView.swift
//  lingoes
//
//  Created by Guen on 07/09/2023.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
