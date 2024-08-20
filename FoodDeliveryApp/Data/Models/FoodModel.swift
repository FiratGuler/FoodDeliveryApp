//
//  FoodModel.swift
//  FoodOrderApp
//
//  Created by Fırat Güler on 11.06.2024.
//

import Foundation

struct FoodModel: Codable {
    
    var foodId: String?
    var foodName: String?
    var foodImage: String?
    var foodPrice: String?
    
    enum CodingKeys: String, CodingKey {
        case foodId = "yemek_id"
        case foodName = "yemek_adi"
        case foodImage = "yemek_resim_adi"
        case foodPrice = "yemek_fiyat"
    }
    
  
    
    
}
