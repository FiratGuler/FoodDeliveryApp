//
//  homeViewModel.swift
//  FoodOrderApp
//
//  Created by Fırat Güler on 11.06.2024.
//

import Foundation
import Alamofire
import RxSwift
import UIKit

class HomeViewModel {
    
    var foodsArr = BehaviorSubject<[FoodModel]>(value: [FoodModel]())
 
    
    var foodRepo = FoodRepo()
    var cartViewModel = CartViewModel()
    var isActive = true

    
    init(){
        foodsArr = foodRepo.foodsArr
        getData()
    }
    
    func getData() {
        foodRepo.getData()
    }
    
    func addCartButton(foodName: String, foodImage: String, foodPrice: String, numberOfFood: Int) {
        cartViewModel.addCartButton(foodName: foodName,
                                    foodImage: foodImage,
                                    foodPrice: foodPrice,
                                    numberOfFood: numberOfFood)
    }
   
    
    func likesButtonClicked () -> UIColor {
        if isActive  {
            isActive = false
            return .red
        }
        else {
            if let fadedColor =  UIColor(named: "FadedColor") {
                isActive = true
                return fadedColor
            }
            else {
                return .gray
            }
        }
    }
    
    
    
    
}
