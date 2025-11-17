//
//  DealDetailDTO.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 16/11/2025.
//

struct DealDetailDTO: Decodable, Identifiable {
    let unique: String
    let title: String
    let image: String
    let company: String
    let description: String
    let city: String
    let sold_label: String
    let prices: PricesDTO
    var id: String { unique }
}
