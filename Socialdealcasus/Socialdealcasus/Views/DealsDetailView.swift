//
//  DealsDetailView.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import SwiftUI

struct DealsDetailView: View {
    
    @StateObject private var viewModel: DealDetailViewModel
    @EnvironmentObject private var currencyStore: CurrencyStore
    @EnvironmentObject private var favoritesStore: FavoritesStore
    let deal: Deal
    
    init(deal: Deal) {
        _viewModel = StateObject(
            wrappedValue: DealDetailViewModel(id: deal.id, service: DealService(), deal: deal)
        )
        self.deal = deal
    }
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                VStack {
                    Spacer()
                    ProgressView(L10n.Deal.detailLoading)
                    Spacer()
                }
            } else if let error = viewModel.errorMessage {
                VStack(spacing: 12) {
                    Spacer()
                    Text(error)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Button(L10n.General.tryAgain) {
                        Task { await viewModel.load() }
                    }
                    Spacer()
                }
            } else if let detail = viewModel.detail {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Image
                        AsyncImage(url: detail.deal.imageURL) { phase in
                            switch phase {
                            case .empty:
                                Color.gray.frame(height: 220)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, minHeight: 220)
                                    .clipped()
                            case .failure:
                                Color.gray.frame(height: 220)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        // Title + favorite
                        HStack(alignment: .top) {
                            Text(detail.deal.title)
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                        }
                        
                        // Company + city
                        VStack(alignment: .leading, spacing: 4) {
                            Text(detail.deal.company)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text(detail.deal.city)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        // Price row
                        HStack(spacing: 12) {
                            Text(currencyStore.format(cents: detail.deal.fromPriceInCents))
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .strikethrough()
                            
                            let split = currencyStore.splitFormattedPrice(cents: detail.deal.priceInCents)
                            HStack(spacing: 0) {
                                Text(split.before)
                                    .font(.title2)
                                    .foregroundStyle(.green)
                                Text(split.after)
                                    .font(.subheadline)
                                    .foregroundStyle(.green)
                            }
                            
                            Spacer()
                        }
                        
                        // Sold label
                        Text(detail.deal.soldLabel)
                            .font(.footnote)
                            .foregroundStyle(.theme)
                        
                        Divider().padding(.vertical, 8)
                        
                        // Description
                        Text(viewModel.decodedDescription)
                        
                    }
                    .padding()
                }
            } else {
                Text(L10n.General.noData)
            }
        }
        .navigationTitle(L10n.Deal.title)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.load()
        }
    }
    
}





