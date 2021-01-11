//
//  ViewController.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2020/12/31.
//

import UIKit
import RealmSwift

class MyListViewController: UIViewController {
    
    //DBから取得した値を保持
    var name: String?
    var location: String?
    var price: String?
    var date: String?
    var url: String?
    var ratingStar: Double?
    
    var hotelDataArray = [HotelDataModel]()
    var hotels: Results<HotelDataModel>?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addHotelBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableview()
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
        // Realmインスタンスの作成.
        let filePath = Realm.Configuration.defaultConfiguration.fileURL
        let realm = try! Realm()
        hotels = realm.objects(HotelDataModel.self)
        if let obj = hotels?.last {
//            name = hotels
//            location = hotels?.
//          
        }
        
        tableView.reloadData()
    }
}
