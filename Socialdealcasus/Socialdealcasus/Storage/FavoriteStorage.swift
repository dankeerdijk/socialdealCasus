//
//  FavoriteStorage.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

final class FavoritesStore: ObservableObject {
    @Published private(set) var favoriteIDs: Set<String> = []
    
    private let storageKey = UserDefaultsKeys.favoriteKey
    
    init() {
        if let stored = UserDefaults.standard.array(forKey: storageKey) as? [String] {
            favoriteIDs = Set(stored)
        }
    }
    
    func isFavorite(id: String) -> Bool {
        favoriteIDs.contains(id)
    }
    
    func toggleFavorite(id: String) {
        if favoriteIDs.contains(id) {
            favoriteIDs.remove(id)
        } else {
            favoriteIDs.insert(id)
        }
        UserDefaults.standard.set(Array(favoriteIDs), forKey: storageKey)
    }
}
