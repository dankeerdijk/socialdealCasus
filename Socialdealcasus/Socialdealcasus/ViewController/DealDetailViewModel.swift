//
//  DealDetailViewModel.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

@MainActor
final class DealDetailViewModel: ObservableObject {
    @Published var detail: DealDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var decodedDescription: String = ""
    @Published var formattedDescription: NSAttributedString?
    let deal:Deal
    private let id: String
    private let service: DealServiceProtocol

    init(id: String, service: DealServiceProtocol, deal: Deal) {
        self.id = id
        self.service = service
        self.deal = deal
    }

    func load() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let dealDetails = try await service.fetchDealDetail()
            
            //x6ji36jvyi4mj9fk is always the deal that comes back should ectually match the demo data
            if dealDetails.deal.id == id || id == "x6ji36jvyi4mj9fk" {
                // IDs match - use the fetched detail with description
                let description = await Task.detached {
                    //decoding it because of the <HTML> tags
                    return dealDetails.description.decoded
                }.value
                
                self.decodedDescription = description
                self.detail = dealDetails
                
            } else {
                // IDs don't match - create DealDetail from the deal object without description so that atleast something will be displayed
                self.detail = DealDetail(deal: deal, description: "")
                self.decodedDescription = ""
            }
            
        } catch {
            self.decodedDescription = ""
            self.detail = nil
            self.errorMessage = L10n.Deal.descriptionLoadError
        }
        isLoading = false
    }

}
