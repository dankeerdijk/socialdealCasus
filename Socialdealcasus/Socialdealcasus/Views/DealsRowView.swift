//
//  DealsRowView.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import SwiftUI

struct DealsRowView: View {
    
    @EnvironmentObject private var favoritesStore: FavoritesStore
    @EnvironmentObject private var currencyStore: CurrencyStore
    
    let deal: Deal

    
    var body: some View {
        
        // white background / card
        VStack{
            // card content
            VStack (alignment: .leading, spacing: 25){
                
                // background image
                ZStack (alignment: .bottomTrailing){
                    
                    AsyncImage(url: deal.imageURL) { phase in
                        switch phase {
                        case .empty:
                            Color.gray
                                .cornerRadius(15)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .cornerRadius(Layout.imageCornerRadius)
                                .padding(.top, 15)

                        case .failure:
                            Color.gray
                                .cornerRadius(15)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    //favoriteButton
                    Button(action: {
                        favoritesStore.toggleFavorite(id: deal.id)
                    }) {
                        Image(systemName: favoritesStore.isFavorite(id: deal.id) ? "heart.fill" : "heart")
                            .font(.system(size: Layout.favoriteButtonSize))
                            .foregroundColor(favoritesStore.isFavorite(id: deal.id) ? .red : .white)
                            .shadow(radius: 4)
                    }
                    .buttonStyle(.borderless) 
                    .padding(Layout.favoriteButtonPadding)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height:Layout.imageHeight)
                
                
                // card details
                VStack(alignment: .leading, spacing: 4) {
                    Text(deal.title)
                        .font(.headline)
                        .lineLimit(2)
                    
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(deal.company)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text(deal.city)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }.padding(.top, 10)
                    
                    
                    HStack(spacing: 15) {
                        Text(deal.soldLabel)
                            .font(.subheadline)
                            .foregroundStyle(.theme)
                        
                        Spacer()
                        
                        Text(currencyStore.format(cents: deal.fromPriceInCents))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .strikethrough()
                        

                        HStack(spacing: 0) {
                            Text(currencyStore.splitFormattedPrice(cents: deal.priceInCents).before)
                                .font(.title)
                                .foregroundStyle(.green)
                            Text(currencyStore.splitFormattedPrice(cents: deal.priceInCents).after)
                                .font(.subheadline)
                                .foregroundStyle(.green)
                        }
                    }.padding(.top, 10)
                }
            }
            .padding(.horizontal, Layout.screenPadding)
            
        }
        .background(Color.white)
        .frame(height: Layout.cardHeight)
    }
}

