//
//  Currency.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

enum Currency: String, CaseIterable, Identifiable {
    case eur = "EUR"
    case usd = "USD"
    var id: String { rawValue }
    
    var symbol: String {
        switch self {
        case .eur: return "€"
        case .usd: return "$"
        }
    }
    
    var displayName: String {
        switch self {
        case .eur: return L10n.Settings.currencyEuro
        case .usd: return L10n.Settings.currencyDollar
        }
    }
}
