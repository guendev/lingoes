//
//  OverlookView.swift
//  lingoes
//
//  Created by Guen on 03/09/2023.
//

import SwiftUI

struct OverlookView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                LinearGradient(colors: [.accentColor, .accentColor], startPoint: .top, endPoint: .bottom)
                    .frame(height: 350)
                    .edgesIgnoringSafeArea(.top)
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "chevron.backward")
                        
                    }
                    .buttonStyle(IconButtonStyle(color: .white))

                    
                    Spacer()
                }
                .padding([.horizontal, .bottom])
                            
                ScrollView(showsIndicators: false) {
                    VStack {
                        
                        SizeBox(height: 10)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Design Talk: UI/UX Sharing Session")
                                .font(.title)
                                .fontWeight(.semibold)
                                .kerning(0.5)
                                .foregroundColor(.white)
                                .lineLimit(2)
                            
                            HStack {
                                
                                Image(systemName: "person")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                
                                Text("Guen dev")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                
                            }
                            .foregroundColor(.white.opacity(0.7))
                            
                            HStack {
                                
                                Image(systemName: "clock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                
                                Text("01:00 - 04:00 PM")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                
                            }
                            .foregroundColor(.white.opacity(0.7))
                        }
                        
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                VStack(alignment: .leading) {
                    
                    Text("Friend’s")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color("Text"))
                    
                    HStack(spacing: 10) {
                        
                        ForEach(0...2, id: \.self) { item in
                            Circle()
                                .fill(Color("Background2"))
                                .frame(width: 40, height: 40)
                        }
                        
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 40, height: 40)
                            .overlay {
                                Text("8+")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                            }
                        
                    }
                    
                }
                .padding([.horizontal, .top])
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(alignment: .top) {
                    
                    Rectangle()
                        .fill(Color("Border"))
                        .frame(height: 1)
                    
                }
                
            }
        }
    }
}

struct OverlookView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OverlookView()
                .environment(\.colorScheme, .light)
            
            OverlookView()
                .environment(\.colorScheme, .dark)
        }
    }
}
