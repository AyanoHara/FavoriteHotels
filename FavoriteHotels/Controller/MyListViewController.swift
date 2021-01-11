//
//  ViewController.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2020/12/31.
//

import UIKit
import RealmSwift

class MyListViewController: UIViewController {
    
    var hotels: Results<HotelDataModel>?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addHotelBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableview()
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchHotelData()
    }
}

//MARK: - TableView
extension MyListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotelListCell", for: indexPath) as! HotelListTableViewCell
        let hotelData = self.hotels?[(indexPath as NSIndexPath).row];
        cell.hotelNameLabel.text = hotelData?.name
        cell.locationLabel.text = "場所 : \(hotelData?.location ?? "")"
        cell.priceLabel.text = hotelData?.price
        cell.ratingStarView.settings.updateOnTouch = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setUpTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let myListNib = UINib(nibName: "HotelListTableViewCell", bundle: nil)
        tableView.register(myListNib, forCellReuseIdentifier: "hotelListCell")
    }
}

//MARK: - RealmSwiftMethods
extension MyListViewController {
    func fetchHotelData() {
        let realm = try! Realm()
        hotels = realm.objects(HotelDataModel.self)
        tableView.reloadData()
    }
}
