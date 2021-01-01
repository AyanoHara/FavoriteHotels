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
        setUpTableView()
    }
    
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapCancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - TableView
extension RegisterHotelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RegisterHotelType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! SectionTableViewCell
        let  datePickerCell = tableView.dequeueReusableCell(withIdentifier: "datePickerCell", for: indexPath) as! DatePickerTableViewCell
        let ratingStarCell = tableView.dequeueReusableCell(withIdentifier: "ratingStarCell", for: indexPath) as! RatingStarTableViewCell
        
        guard let cellType = RegisterHotelType(rawValue: indexPath.row) else { return UITableViewCell() }
        
        switch cellType {
        case .name:
            return sectionCell
        case .location:
            return sectionCell
        case .price:
            return sectionCell
        case .date:
            return datePickerCell
        case .url:
            return sectionCell
        case .ratingStar:
            return ratingStarCell
        }
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let sectionNib = UINib(nibName: "SectionTableViewCell", bundle: nil)
        tableView.register(sectionNib, forCellReuseIdentifier: "sectionCell")
        
        let datePickerNib = UINib(nibName: "DatePickerTableViewCell", bundle: nil)
        tableView.register(datePickerNib, forCellReuseIdentifier: "datePickerCell")
        
        let ratingStarNib = UINib(nibName: "RatingStarTableViewCell", bundle: nil)
        tableView.register(ratingStarNib, forCellReuseIdentifier: "ratingStarCell")
    }
}
