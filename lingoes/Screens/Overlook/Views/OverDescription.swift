//
//  OverDescription.swift
//  lingoes
//
//  Created by Guen on 04/09/2023.
//

import SwiftUI

struct OverDescription: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Description")
                .kerning(0.5)
                .font(.headline)
                .foregroundColor(Color("Text"))
            
            Text("Amet minim mollit non deserunt ullamco est sit dolor do amet sint velit officia.")
                .font(.subheadline)
              .kerning(0.5)
              .foregroundColor(Color("Text2"))
            
        }
    }
}

struct Overdescription_Previews: PreviewProvider {
    static var previews: some View {
        OverDescription()
    }
}
