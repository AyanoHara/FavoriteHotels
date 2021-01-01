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
        
        var title: String {
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
            sectionCell.titleText = RegisterHotelType.name.title
            return sectionCell
        case .location:
            sectionCell.titleText = RegisterHotelType.location.title
            return sectionCell
        case .price:
            sectionCell.titleText = RegisterHotelType.price.title
            return sectionCell
        case .date:
            datePickerCell.titleText = RegisterHotelType.date.title
            return datePickerCell
        case .url:
            sectionCell.titleText = RegisterHotelType.url.title
            return sectionCell
        case .ratingStar:
            ratingStarCell.titleText = RegisterHotelType.ratingStar.title
            return ratingStarCell
        }
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let sectionNib = UINib(nibName: "SectionTableViewCell", bundle: nil)
        tableView.register(sectionNib, forCellReuseIdentifier: "sectionCell")
        let datePickerNib = UINib(nibName: "DatePickerTableViewCell", bundle: nil)
        tableView.register(datePickerNib, forCellReuseIdentifier: "datePickerCell")
        let ratingStarNib = UINib(nibName: "RatingStarTableViewCell", bundle: nil)
        tableView.register(ratingStarNib, forCellReuseIdentifier: "ratingStarCell")
    }
}
