//
//  DefaultValues.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 17/11/2025.
//

enum UserDefaultsKeys {
    static let selectedCurrencyKey = "selectedCurrency"
    static let favoriteKey = "favoriteDealIDs"
}

enum GlobalValues {
    static let base_image_url = "https://media.socialdeal.nl"
    static let fetch_deals_url = "https://media.socialdeal.nl/demo/deals.json"
    //i would change unique for the real id if the data was not returned as one static item
    static let fetch_deal_detail_url = "https://media.socialdeal.nl/demo/details.json?id=unique"
}

