//
//  TabView.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import SwiftUI

struct RootTabView: View {
    
    @StateObject private var favoritesStore = FavoritesStore()
    @StateObject private var currencyStore = CurrencyStore()
    @StateObject private var viewModelDeals = DealsListViewModel(service: DealService())
    
    var body: some View {
        
        TabView {
            // Deals tab
            DealsView()
                .tabItem {
                    Label(L10n.Deal.title, systemImage: "list.bullet")
                }
            
            // Favorites tab
            FavoritesView()
                .tabItem {
                    Label(L10n.Favorites.title, systemImage: "heart.fill")
                }
            
            // Settings tab
            SettingsView()
                .tabItem {
                    Label(L10n.Settings.title, systemImage: "gearshape")
                }
        }
        .tint(.theme)
        .environmentObject(favoritesStore)
        .environmentObject(currencyStore)
        .environmentObject(viewModelDeals)
    }
}

