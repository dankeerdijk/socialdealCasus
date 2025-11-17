//
//  Extentions.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 17/11/2025.
//

import WebKit

// MARK: - strings
extension String {
    var decoded: String {
        let attr = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil)
        
        return attr?.string ?? self
    }
    
    var htmlToNSAttributedString: NSAttributedString? {
        let data = Data(utf8)
        do {
            return try NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
        } catch {
            return nil
        }
    }
}
