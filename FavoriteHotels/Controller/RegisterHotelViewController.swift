//
//  RegisterNewHotelViewController.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2020/12/31.
//

import UIKit

class RegisterHotelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    enum RegisterHotelType: Int, CaseIterable {
        case name
        case location
        case price
        case date
        case url
        case ratingStar
        
        var title: String? {
            switch self {
            case .name: return "ホテルの名前"
            case .location: return "場所"
            case .price: return "値段 (円/泊)"
            case .date: return "チェックインした日付"
            case .url: return "ホテルのURL"
            case .ratingStar: return "評価"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapCancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
