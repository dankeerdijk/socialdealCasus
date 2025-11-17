//
//  PricesDTO.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

struct PricesDTO: Decodable {
    let price: PriceDTO
    let from_price: PriceDTO?
    let price_label: String?
    let discount_label: String?
}
