//
//  ContentView.swift
//  lingoes
//
//  Created by Guen on 01/09/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("hasShownOnboarding") private var hasShownOnboarding = false
    
    var body: some View {
        Group {
            if !hasShownOnboarding {
                MainView()
            } else {
                OnboardingView()
            }
        }
        .onAppear {
            hasShownOnboarding = true
        }
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
