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
    @StateObject var toastViewModel: ToastViewModel = .init()

    var body: some View {
        
        ZStack {
            
            Group {
                if !hasShownOnboarding {
                    MainView()
                } else {
                    AuthView()
                    // OnboardingView()
                }
            }
            
            ToastView()
            
        }
        .onAppear {
            hasShownOnboarding = true
        }
        .onAppear {
            NotificationService.shared.requestAuthorization()
            NotificationService.shared.setup()
        }
        .environmentObject(toastViewModel)
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
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
