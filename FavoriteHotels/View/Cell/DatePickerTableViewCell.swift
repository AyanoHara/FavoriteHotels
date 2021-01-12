//
//  DatePickerTableViewCell.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2021/01/01.
//

import UIKit

protocol DatePickerTableViewCellDelegate {
    func fetchDatePickerValue(datePicker: UIDatePicker, dateString: String)
}

class DatePickerTableViewCell: UITableViewCell {
    
    var date: String?
    var delegate: DatePickerTableViewCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didChangeDatePicker(_ sender: UIDatePicker) {
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        date  = formatter.string(from: datePicker.date)
        print(date)
        delegate?.fetchDatePickerValue(datePicker: datePicker, dateString: date ?? "-----")
    }
    
    var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
}
