//
//  DashboardAppBar.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct DashboardAppBar: View {
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text("Hi, Guen")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Text2"))
                
                Text("Find Your Specialits")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Text"))
                
            }
            
            Spacer()
            
            LanguageSwicher()

        }
    }
}

struct DashboardAppBar_Previews: PreviewProvider {
    static var previews: some View {
        DashboardAppBar()
    }
}
