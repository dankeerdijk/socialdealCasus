//
//  SocialdealcasusApp.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 15/11/2025.
//

import SwiftUI

@main
struct SocialdealcasusApp: App {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.shadowColor = .lightGray
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            RootTabView()
        }
    }
}
