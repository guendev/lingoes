//
//  SettingsMenu.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct SettingsMenu: View {
    var menu: [SettingMenuItem] = [
        SettingMenuItem(icon: "person", label: "Personal Info", onClick: {}),
        SettingMenuItem(icon: "pencil.and.outline", label: "Learing", onClick: {}),
        SettingMenuItem(icon: "note.text", label: "My cources", onClick: {}),
        SettingMenuItem(icon: "link", label: "Connect", onClick: {})
    ]
    
    var us: [SettingMenuItem] = [
        SettingMenuItem(icon: "person.and.background.dotted", label: "About Us", onClick: {}),
        SettingMenuItem(icon: "info", label: "Version", onClick: {})
    ]
    
    func MenuItem(_ item: SettingMenuItem) -> some View {
        Button {
            
        } label: {
            
            HStack {
                
                Button {
                    
                } label: {
                    Image(systemName: item.icon)
                }
                .buttonStyle(IconButtonStyle(background: Color("Background2"), borderColor: .clear))
                
                Text(item.label)
                    .font(.subheadline)
                    .foregroundColor(Color("Text"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Text"))
                    .frame(width: 12, height: 12)
                    .opacity(0.5)
                
                
            }
            
        }
        .buttonStyle(.plain)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            
            VStack(spacing: 20) {
                
                ForEach(menu) { item in
                    
                    MenuItem(item)

                    
                }
                
            }
            
            Color("Border")
                .frame(height: 1)
                .frame(maxWidth: .infinity)
            
            VStack(spacing: 20) {
                
                ForEach(us) { item in
                    
                    MenuItem(item)
                    
                }
                
            }
            
            Button {

            } label: {
                Text("Logout")
            }
            .buttonStyle(PrimaryButtonStyle(color: Color("Danger"), size: .lg, block: true))

            
        }
    }
}

struct SettingsMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
