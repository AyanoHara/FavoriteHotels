//
//  HotelDataModel.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2021/01/01.
//

import Foundation
import RealmSwift

class HotelDataModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var location: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var ratingStar: Double = 0.0
    
//    init(name: String, location: String, price: String, date: String, url: String, ratingStar: Double) {
//        self.name = name
//        self.location = location
//        self.price = price
//        self.date = date
//        self.url = url
//        self.ratingStar = ratingStar
//    }
}
