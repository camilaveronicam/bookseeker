//
//  API.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import Foundation

/* BASE URL */

/* GET */
let  baseURL =  "https://itunes.apple.com/search?term=swift&entity=ibook"

func endpointForURL(_ url:String) -> String {
    
    return baseURL + url
    
}

