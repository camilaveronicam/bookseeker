//
//  Response.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import Foundation

enum Response<T, E> {
    case Success(T)
    case Failure(E)
}
