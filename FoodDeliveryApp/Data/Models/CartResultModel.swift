//
//  CartResultModel.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 3.07.2024.
//

import Foundation

struct CartResultModel : Decodable {
    
    var cart : [CartModel]?
    var success : Int?
    
    enum CodingKeys : String, CodingKey {
        case cart = "sepet_yemekler"
        case success 
    }
 
}
