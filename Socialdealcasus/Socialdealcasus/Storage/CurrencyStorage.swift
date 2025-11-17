//
//  CurrencyStorage.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

final class CurrencyStore: ObservableObject {
    private let storageKey = UserDefaultsKeys.selectedCurrencyKey
    
    @Published var selected: Currency {
        didSet {
            UserDefaults.standard.set(selected.rawValue, forKey: storageKey)
        }
    }
    
    init() {
        if let raw = UserDefaults.standard.string(forKey: storageKey),
           let stored = Currency(rawValue: raw) {
            selected = stored
        } else {
            selected = .eur
        }
    }
    
    func format(cents: Int) -> String {
        let base = Double(cents) / 100.0
        let value: Double
        
        switch selected {
        case .eur:
            value = base
        case .usd:
            // should use the real rate this is just an example
            value = base * 1.1
        }
        
        return String(format: "%@ %.2f", selected.symbol, value).replacingOccurrences(of: ".", with: ",")
    }
    
    func splitFormattedPrice(cents: Int) -> (before: String, after: String) {
            let full = self.format(cents: cents)
            
            guard let commaIndex = full.firstIndex(of: ",") else {
                return (full, "")
            }
            let before = String(full[..<commaIndex])
            let after = String(full[commaIndex...])
            return (before, after)
        }
    
}
