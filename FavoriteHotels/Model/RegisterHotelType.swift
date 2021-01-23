//
//  RegisterHotelType.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2021/01/23.
//

import Foundation

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
