//
//  DealDTO.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

import Foundation

struct DealDTO: Decodable, Identifiable {
    let unique: String
    let title: String
    let image: String
    let sold_label: String
    let company: String
    let city: String
    let prices: PricesDTO
    var id: String { unique }
}
