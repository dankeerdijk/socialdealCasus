//
//  SettingsView.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var currencyStore: CurrencyStore
       
       var body: some View {
           NavigationStack {
               Form {
                   Section(header: Text(L10n.Settings.currency)) {
                       Picker(L10n.Settings.currency, selection: $currencyStore.selected) {
                           ForEach(Currency.allCases) { currency in
                               Text(currency.displayName)
                                   .tag(currency)
                           }
                       }
                       .pickerStyle(.segmented)
                   }
               }
               .navigationTitle(L10n.Settings.title)
           }
       }
}
