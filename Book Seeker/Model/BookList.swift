//
//  BookList.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import Foundation

class BookList: Decodable {

    var resultCount: Int
    var results: [BookDetail]

    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
}
