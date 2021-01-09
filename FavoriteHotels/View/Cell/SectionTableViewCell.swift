//
//  SectionTableViewCell.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2021/01/01.
//

import UIKit

protocol SectionTableViewCellDelegate {
    //TFの値を取得するため
    func fetchTFValue(textField: UITextField, cellType: RegisterHotelType)
}

class SectionTableViewCell: UITableViewCell {
    
    var delegate: SectionTableViewCellDelegate?
    var cellType: RegisterHotelType?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        answerTextField.delegate = self
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

//MARK: - TextFieldDelegate
extension SectionTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.contentView.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let cellType = cellType else { return }
        delegate?.fetchTFValue(textField: textField, cellType: cellType)
    }
}
