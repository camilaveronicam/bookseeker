//
//  BookTableViewCell.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import UIKit
import SDWebImage
import Cosmos

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
        
    var book: BookDetail? {
        didSet {
            self.setValues()
        }
    }
        
    func setValues() {
        guard let book = book else { return }
        nameLabel.text = book.trackName
        authorLabel.text = book.artistName
        guard let genres = book.genres else { return }
        genreLabel.text = genres.joined(separator:", ")

        if let rate = book.averageUserRating {
            let doubleValue = Double(rate)
            self.rateView.rating = doubleValue
        }

        if let urlString = book.artworkUrl100, let url = URL(string:urlString) {
            artworkImage.sd_setImage(with:url)
        }
    }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            rateView.settings.fillMode = .precise
            rateView.settings.updateOnTouch = false
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            artworkImage.image = nil
        }
    }
