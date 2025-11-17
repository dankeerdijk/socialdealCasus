//
//  FavoritesView.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var viewModel: DealsListViewModel
    @EnvironmentObject private var favoritesStore: FavoritesStore
    @State private var selectedDeal: Deal? = nil
    
    var body: some View {
        
        NavigationStack{
    
            VStack(spacing: 0) {
                // Top bar
                VStack {
                    Text(L10n.Favorites.title)
                        .font(.title3)
                        .foregroundStyle(.white)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .frame(height: Layout.topBarHeight)
                .background(Color.theme)
                .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 3)
                .zIndex(1)
                
                // Content
                let favoriteDeals = viewModel.deals.filter { deal in
                    favoritesStore.isFavorite(id: deal.id)
                }
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView(L10n.Favorites.loading)
                    Spacer()
                } else if favoriteDeals.isEmpty {
                    Spacer()
                    Text(L10n.Favorites.empty)
                        .foregroundStyle(.secondary)
                    Spacer()
                } else {
                    List(favoriteDeals) { deal in
                        DealsRowView(deal: deal)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .frame(width: UIScreen.main.bounds.width)
                            .onTapGesture {
                                selectedDeal = deal
                            }
                    }
                    .listStyle(.plain)
                    .background(Color(.systemGroupedBackground))
                    .navigationDestination(item: $selectedDeal) { deal in
                        DealsDetailView(deal: deal)
                    }
                }
            }
        }
    }
}
