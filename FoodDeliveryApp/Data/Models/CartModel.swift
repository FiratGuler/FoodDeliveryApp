//
//  CartModel.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 3.07.2024.
//

import Foundation

struct CartModel: Codable {
    
    var cartId: String?
    var foodName: String?
    var foodImage: String?
    var foodPrice: String?
    var numberOfFood: String?
    var userName: String?
    
    enum CodingKeys: String, CodingKey {
        case cartId = "sepet_yemek_id"
        case foodName = "yemek_adi"
        case foodImage = "yemek_resim_adi"
        case foodPrice = "yemek_fiyat"
        case numberOfFood = "yemek_siparis_adet"
        case userName = "kullanici_adi"
    }
}



