//
//  AppBar.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct AppBarActionItem: Identifiable {
    var id: String = UUID().uuidString
    var icon: String
    var onClick: () -> Void
}

struct AppBar<Content>: View where Content: View {
    var onDissmiss: (() -> Void)?
    var actions: [AppBarActionItem]?
    var content: () -> Content
    
    init(
        onDissmiss: (() -> Void)? = nil,
        actions: [AppBarActionItem]? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.onDissmiss = onDissmiss
        self.actions = actions
        self.content = content
    }
    
    init(
        onDissmiss: (() -> Void)? = nil,
        actions: [AppBarActionItem]? = nil
    ) where Content == EmptyView {
        self.onDissmiss = onDissmiss
        self.actions = actions
        self.content = {
            (EmptyView())
        }
    }
    
    var body: some View {
        HStack {
            
            Button {
        
                
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 42, height: 42)
                    .overlay {
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("Border"), lineWidth: 1)
                    }
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            if actions != nil {
                
                HStack {
                    
                    ForEach(actions!) { action in
                        
                        Button {
                            
                            action.onClick()
                            
                        } label: {
                            Image(systemName: action.icon)
                                .frame(width: 42, height: 42)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("Border"), lineWidth: 1)
                                }
                        }
                        .buttonStyle(.plain)
                        
                    }
                    
                }
            }
            
        }
        .padding(.horizontal)
        .overlay {
            content()
        }
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar()
    }
}
