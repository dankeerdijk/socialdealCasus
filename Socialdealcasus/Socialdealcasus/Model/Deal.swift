//
//  DealModel.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

struct Deal: Identifiable, Hashable, Decodable {
    let id: String
    let title: String
    let company: String
    let city: String
    let soldLabel: String
    let imageURL: URL?
    let priceInCents: Int
    let fromPriceInCents: Int
    let currencySymbol: String
    let currencyCode: String
    let discountLabel: String?

    var price: Double {
        Double(priceInCents) / 100.0
    }

    var fromPrice: Double {
        Double(fromPriceInCents) / 100.0
    }

    var formattedPrice: String {
        String(format: "%@ %.2f", currencySymbol, price)
    }

    var formattedFromPrice: String {
        String(format: "%@ %.2f", currencySymbol, fromPrice)
    }
    
}

extension Deal {
    init(dto: DealDTO, baseImageURL: String = GlobalValues.base_image_url) {
        id = dto.unique
        title = dto.title
        company = dto.company
        city = dto.city
        soldLabel = dto.sold_label

        let priceDTO = dto.prices.price
        let fromPriceDTO = dto.prices.from_price

        priceInCents = priceDTO.amount
        fromPriceInCents = fromPriceDTO?.amount ?? 0
        currencySymbol = priceDTO.currency.symbol
        currencyCode = priceDTO.currency.code
        discountLabel = dto.prices.discount_label

        //i did this just incase there is already a prefix
        if dto.image.hasPrefix("http") {
            imageURL = URL(string: dto.image)
        } else {
            imageURL = URL(string: baseImageURL + dto.image)
        }
    }
}
