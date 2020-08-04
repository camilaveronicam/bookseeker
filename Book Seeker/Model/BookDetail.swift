//
//  BookDetail.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import Foundation

class BookDetail: Decodable {

    var artworkUrl60: String?
    var artworkUrl100: String?
    var artistViewUrl: String?
    var trackCensoredName: String?
    var fileSizeBytes: Int?
    var trackViewUrl: String?
    var trackName: String?
    var trackId: Int?
    var releaseDate: String?
    var genreIds: [String]?
    var formattedPrice: String?
    var artistIds: [Int]?
    var currency: String?
    var kind: String?
    var artistId: Int?
    var artistName: String?
    var genres: [String]?
    var price: Double?
    var description: String?
    var averageUserRating: Double?
    var userRatingCount: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case artworkUrl60
        case artworkUrl100
        case artistViewUrl
        case trackCensoredName
        case fileSizeBytes
        case trackViewUrl
        case trackName
        case trackId
        case releaseDate
        case genreIds
        case formattedPrice
        case artistIds
        case currency
        case kind
        case artistId
        case artistName
        case genres
        case price
        case description
        case averageUserRating
        case userRatingCount
    }
}
