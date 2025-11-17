//
//  PriceDTO.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

struct PriceDTO: Decodable {
    let amount: Int   
    let currency: CurrencyDTO
}
