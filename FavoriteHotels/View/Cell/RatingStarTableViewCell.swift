//
//  RatingStarTableViewCell.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2021/01/01.
//

import UIKit
import Cosmos

class RatingStarTableViewCell: UITableViewCell {
    
    var result = 0.0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingStarView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        ratingStarView.didTouchCosmos = { rating in
            self.result = rating
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
}
