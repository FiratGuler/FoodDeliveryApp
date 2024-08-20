//
//  FoodResultModel.swift
//  FoodOrderApp
//
//  Created by Fırat Güler on 11.06.2024.
//

import Foundation

struct FoodResultModel: Codable {
    var foods : [FoodModel]?
    var success : Int?
    
    enum CodingKeys : String,CodingKey {
        case foods = "yemekler"
    }
    
}
