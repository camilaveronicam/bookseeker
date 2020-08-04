//
//  LoadingView.swift
//  Book Seeker
//
//  Created by Camila Matias on 04/08/20.
//

import UIKit
import Foundation
import NVActivityIndicatorView

class LoadingView: UIViewController, NVActivityIndicatorViewable {
    
    static let shared = LoadingView()
    
     private let presentingIndicatorTypes = {
           return NVActivityIndicatorType.allCases.filter { $0 != .blank }
       }()
    
    func startLoading(with text:String) {
        let size = CGSize(width: 30, height: 30)
        startAnimating(size, message: text, type: .ballPulse , fadeInAnimation: nil)
    }
    
    func stopLoading() {
        self.stopAnimating(nil)
    }
}

