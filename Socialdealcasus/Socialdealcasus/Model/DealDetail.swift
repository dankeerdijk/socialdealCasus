//
//  DealDetail.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

struct DealDetail: Decodable {
    let deal: Deal
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case deal
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deal = try container.decode(Deal.self, forKey: .deal)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
extension DealDetail {
    
    init(deal: Deal, description: String) {
        self.deal = deal
        self.description = description
    }

    init(dto: DealDetailDTO, baseImageURL: String = GlobalValues.base_image_url) {
        let dealDTO = DealDTO(
            unique: dto.unique,
            title: dto.title,
            image: dto.image,
            sold_label: dto.sold_label,
            company: dto.company,
            city: dto.city,
            prices: dto.prices
        )
        self.deal = Deal(dto: dealDTO, baseImageURL: baseImageURL)
        self.description = dto.description
    }
}
