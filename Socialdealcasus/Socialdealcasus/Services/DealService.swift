//
//  DealService.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

protocol DealServiceProtocol {
    func fetchDeals() async throws -> [Deal]
    func fetchDealDetail() async throws -> DealDetail
}

final class DealService: DealServiceProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchDeals() async throws -> [Deal] {
        let url = URL(string: GlobalValues.fetch_deals_url)!
        let response: DealsResponse = try await apiClient.get(url)
        return response.deals.map { Deal(dto: $0) }
    }
    
    func fetchDealDetail() async throws -> DealDetail {
        let url = URL(string: GlobalValues.fetch_deal_detail_url)!
        let dto: DealDetailDTO = try await apiClient.get(url)
        return DealDetail(dto: dto)
    }
}
