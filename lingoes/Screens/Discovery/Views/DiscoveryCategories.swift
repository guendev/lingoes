//
//  DiscoveryCategories.swift
//  lingoes
//
//  Created by Guen on 10/09/2023.
//

import SwiftUI

struct DiscoveryCategories: View {
    
    @EnvironmentObject var viewModel: DiscoveryViewModel
    
    @State var currentIndex: Int = 0
    @State var width: CGFloat = .zero
    
    @Namespace var animation
    
    var body: some View {
        SessionView {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 14) {
                    
                    ForEach(viewModel.categories.indices, id: \.self) { index in
                        CategoryButton(index)
                    }
                    
                }
                
            }
            
        } content: {
            
            BasicCarouselSlider(items: viewModel.categories[currentIndex].items) { item in
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Sizeable { size in
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: size.width * 0.7)
                    }
                    .padding(.bottom, 5)
                    
                    Text(item.name)
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color("Text"))
                    
                    Text("Heartfly")
                        .font(.caption)
                        .foregroundColor(Color("Text2"))
                                        
                    
                    HStack(spacing: 10) {
                        
                        HStack(spacing: 4) {
                            
                            Image(systemName: "pencil.and.outline")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                            
                            Text("160")
                                .font(.subheadline)
                            
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                            
                            Text("14h")
                                .font(.subheadline)
                            
                        }
                        
                    }
                    .foregroundColor(Color("Text2"))
                }
                .padding(.horizontal, 12)
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background {
                    Color("Background2")
                }
                .cornerRadius(18)
            }
            .spaceBetween(18)
            .slidesPerView(getSlidesPerView())
            
            
        }
        .sizeDetector(width: $width)

    }
    
    func getSlidesPerView() -> CGFloat {
        return 2.5
    }
    
    @ViewBuilder
    fileprivate func CategoryButton(_ index: Array<Category>.Index) -> some View {
        Button {
            
            withAnimation {
                currentIndex = index
            }
            
        } label: {
            Text(viewModel.categories[index].name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(currentIndex == index ? .white : Color("Text2"))
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background {
                    if currentIndex == index {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.accentColor)
                            .matchedGeometryEffect(id: "CATEGORY_ITEM", in: animation)
                    }
                }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct DiscoveryCategories_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environment(\.colorScheme, .light)
            
            MainView()
                .environment(\.colorScheme, .dark)
        }
    }
}
