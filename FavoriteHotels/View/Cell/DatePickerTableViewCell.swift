//
//  DatePickerTableViewCell.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2021/01/01.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
    
    var date: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        date = "\(formatter.string(from: datePicker.date))"
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
