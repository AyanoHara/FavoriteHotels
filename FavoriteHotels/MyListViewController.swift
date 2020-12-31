//
//  ViewController.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2020/12/31.
//

import UIKit

class MyListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addHotelBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableview()
    }
}

//MARK: - TableView
extension MyListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //レイアウト確認のため３を返してるが、本来は登録されているホテルの数
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotelListCell", for: indexPath) as! HotelListTableViewCell
        
        return cell
    }
    
    func setUpTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        let myListNib = UINib(nibName: "HotelListTableViewCell", bundle: nil)
        tableView.register(myListNib, forCellReuseIdentifier: "hotelListCell")
    }
}
