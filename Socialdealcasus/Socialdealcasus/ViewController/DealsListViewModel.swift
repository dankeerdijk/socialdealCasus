//
//  DealsListViewModel.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

@MainActor
final class DealsListViewModel: ObservableObject {
    @Published var deals: [Deal] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    private let service: DealServiceProtocol

    init(service: DealServiceProtocol) {
        self.service = service
    }

    func loadDeals() async {
        guard !isLoading else { return }

        isLoading = true
        errorMessage = nil

        do {
            let result = try await service.fetchDeals()
            self.deals = result
        } catch {
            self.errorMessage = L10n.Deal.loadError
        }

        isLoading = false
    }
}
