//
//  RegisterNewHotelViewController.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2020/12/31.
//

import UIKit
import RealmSwift

class RegisterHotelViewController: UIViewController {
    
    var hotelDataArray = [HotelDataModel]()
    var name: String?
    var location: String?
    var price: String?
    var date: String?
    var url: String?
    var ratingStar: Double?
    var ratingCell = RatingStarTableViewCell()
    var newHotelData = HotelDataModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        showSaveAlert()
    }
    
    @IBAction func didTapCancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func showSaveAlert() {
        let alert = UIAlertController(title: "内容を保存", message: "この内容でよろしいですか？", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "OK", style: .default) { [self] _ in
            ratingStar = ratingCell.result
            print(name)
            print(location)
            print(price)
            print(date)
            print(url)
            print(ratingStar)
            saveHotelData(hotelData: newHotelData)
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - TableView
extension RegisterHotelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RegisterHotelType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! SectionTableViewCell
        let datePickerCell = tableView.dequeueReusableCell(withIdentifier: "datePickerCell", for: indexPath) as! DatePickerTableViewCell
        ratingCell = tableView.dequeueReusableCell(withIdentifier: "ratingStarCell", for: indexPath) as! RatingStarTableViewCell
        
        guard let cellType = RegisterHotelType(rawValue: indexPath.row) else { return UITableViewCell() }
        
        sectionCell.delegate = self
        
        switch cellType {
        case .name:
            sectionCell.titleText = RegisterHotelType.name.title
            sectionCell.cellType = .name
            return sectionCell
        case .location:
            sectionCell.titleText = RegisterHotelType.location.title
            sectionCell.cellType = .location
            return sectionCell
        case .price:
            sectionCell.titleText = RegisterHotelType.price.title
            sectionCell.cellType = .price
            sectionCell.setNumberKeyboard()
            return sectionCell
        case .date:
            datePickerCell.titleText = RegisterHotelType.date.title
            date = datePickerCell.date
            return datePickerCell
        case .url:
            sectionCell.titleText = RegisterHotelType.url.title
            sectionCell.cellType = .url
            return sectionCell
        case .ratingStar:
            ratingCell.titleText = RegisterHotelType.ratingStar.title
            return ratingCell
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

// MARK: -Protocol
extension RegisterHotelViewController: SectionTableViewCellDelegate {
    //TFの値を取得するため
    func fetchTFValue(textField: UITextField, cellType: RegisterHotelType) {
        switch cellType {
        case .name: name = textField.text
        case .location: location = textField.text
        case .price: price = textField.text
        case .date: break
        case .url: url = textField.text
        case .ratingStar: break
        }
    }
}

//MARK: - RealmSwiftMethods

extension RegisterHotelViewController {
    func saveHotelData(hotelData: HotelDataModel) {
        let realm = try! Realm()
        hotelData.name = name ?? "-----"
        hotelData.location = location ?? "-----"
        hotelData.price = price ?? "-----"
        hotelData.date = date ?? "-----"
        hotelData.url = url ?? "-----"
        hotelData.ratingStar = ratingStar ?? 0.0
        
        do {
            try realm.write {
                realm.add(hotelData)
            }
        } catch {
            print("Error saving data \(error)")
        }
        tableView.reloadData()
    }
}
