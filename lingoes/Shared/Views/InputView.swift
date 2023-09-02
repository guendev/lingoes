//
//  InputView.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

struct InputView<Prefix, Suffix>: View where Prefix: View, Suffix: View {
    @Binding var value: String
    var label: String?
    var placeholder: String?
    
    var prefix: () -> Prefix?
    var suffix: () -> Suffix?
    
    
    init(
        value: Binding<String>,
        label: String?,
        placeholder: String?,
        @ViewBuilder prefix: @escaping () -> Prefix? = { nil },
        @ViewBuilder suffix: @escaping () -> Suffix? = { nil }
    ) {
        self._value = value
        self.label = label
        self.placeholder = placeholder
        self.prefix = prefix
        self.suffix = suffix
    }
    
    init(
        value: Binding<String>,
        label: String?,
        placeholder: String?,
        @ViewBuilder suffix: @escaping () -> Suffix? = { nil }
    ) where Prefix == EmptyView {
        self._value = value
        self.label = label
        self.placeholder = placeholder
        self.prefix = {
            (EmptyView())
        }
        self.suffix = suffix
    }
    
    init(
        value: Binding<String>,
        label: String?,
        placeholder: String?,
        @ViewBuilder prefix: @escaping () -> Prefix? = { nil }
    ) where Suffix == EmptyView {
        self._value = value
        self.label = label
        self.placeholder = placeholder
        self.prefix = prefix
        self.suffix = {
            (EmptyView())
        }
    }
    
    init(
        value: Binding<String>,
        label: String?,
        placeholder: String?
    ) where Suffix == EmptyView, Prefix == EmptyView {
        self._value = value
        self.label = label
        self.placeholder = placeholder
        self.prefix = {
            (EmptyView())
        }
        self.suffix = {
            (EmptyView())
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            if label != nil {
                Text(label!)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.09, green: 0.11, blue: 0.18))
            }
                                
            TextField(text: $value) {
                Text("\(placeholder ?? "")")
                    .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.65))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 15)
            .background(Color(red: 0.98, green: 0.98, blue: 0.98))
            .cornerRadius(26)
            
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
