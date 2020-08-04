//
//  Int+HTTPStatusCode.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import Foundation

extension Int {
    public var isSuccessHTTPCode: Bool {
        return  200 <= self && self < 300
    }
}
