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
    
    var dateString: String?
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        dateString  = formatter.string(from: datePicker.date)
        delegate?.fetchDatePickerValue(datePicker: datePicker, dateString: dateString ?? "-----")
    }
    
    var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
}
