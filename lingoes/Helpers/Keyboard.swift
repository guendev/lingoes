//
//  Keyboard.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

import SwiftUI

#if canImport(UIKit)
import UIKit

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#elseif canImport(AppKit)
import AppKit

extension View {
    func hideKeyboard() {
        NSApplication.shared.keyWindow?.endEditing(true)
    }
}
#endif
