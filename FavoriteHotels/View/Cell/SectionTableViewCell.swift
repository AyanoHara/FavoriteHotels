//
//  SectionTableViewCell.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2021/01/01.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
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
