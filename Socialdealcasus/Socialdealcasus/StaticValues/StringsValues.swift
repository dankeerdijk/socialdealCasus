//
//  StringsValues.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 17/11/2025.
//
import Foundation

enum L10n {
    
    // MARK: - General
    enum General {
        static var noData: String {
            NSLocalizedString("no_data", comment: "Shown when no data is available")
        }
        
        static var tryAgain: String {
            NSLocalizedString("try_again", comment: "Button title for retrying an action")
        }
    }
    
    // MARK: - Deal
    enum Deal {
        static var title: String {
            NSLocalizedString("deal", comment: "Navigation title for a deal detail screen")
        }
        
        static var loadError: String {
            NSLocalizedString("deal_load_error", comment: "Error when loading deals fails")
        }
        
        static var detailLoading: String {
            NSLocalizedString("deal_detail_loading", comment: "Shown while loading deal details")
        }
        
        static var descriptionLoadError: String {
            NSLocalizedString("description_load_error", comment: "Error when loading deal description fails")
        }
    }
    
    // MARK: - Favorites
    enum Favorites {
        static var title: String {
            NSLocalizedString("favorites", comment: "Navigation title for favorites screen")
        }
        
        static var loading: String {
            NSLocalizedString("favorites_loading", comment: "Shown while loading favorites")
        }
        
        static var empty: String {
            NSLocalizedString("no_favorites", comment: "Shown when user has no favorites")
        }
    }
    
    // MARK: - Settings
    enum Settings {
        static var title: String {
            NSLocalizedString("settings", comment: "Settings screen title")
        }
        
        static var currency: String {
            NSLocalizedString("valuta", comment: "Title for currency selection")
        }
        
        static var currencyDollar: String {
            NSLocalizedString("currency_dollar", comment: "Dollar currency option label")
        }
        
        static var currencyEuro: String {
            NSLocalizedString("currency_euro", comment: "Euro currency option label")
        }
    }
}
