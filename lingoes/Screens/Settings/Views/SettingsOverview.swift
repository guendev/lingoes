//
//  SettingsOverview.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct SettingsOverview: View {
    
    var words: SettingOverviewItem = SettingOverviewItem(
        icon: "book.closed",
        onClick: {},
        title: "Words",
        subtitle: "250",
        backgroud: Color("Success")
    )
    
    @State var width: CGFloat = .init()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Overview")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color("Text"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack(spacing: 18) {
                HStack(spacing: 16) {
                    ItemView(words)
                    ItemView(words)
                }
                HStack(spacing: 16) {
                    ItemView(words)
                    ItemView(words)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
        .background {
            Color("Background2")
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 10)
    }
    
    
    @ViewBuilder
    func ItemView(_ data: SettingOverviewItem) -> some View {
        HStack(spacing: 14) {
            
            Button {
                
            } label: {
                Image(systemName: data.icon)
            }
            .buttonStyle(IconButtonStyle(size: 42, color: .white, background: data.backgroud, borderBorder: .clear))

            
            VStack(alignment: .leading, spacing: 3) {
                Text(data.title)
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text(data.subtitle)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: .infinity)
    }
}

struct SettingsOverview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
