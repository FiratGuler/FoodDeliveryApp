//
//  CartViewModel.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 3.07.2024.
//

import Foundation
import RxSwift

class CartViewModel {
    
    var cartList = BehaviorSubject<[CartModel]>(value: [CartModel]())
    
    let cartRepo = CartRepo()
    var userName = "Firat_Guler"
    
    init(){
        cartList = cartRepo.cartList
    }
    
    func getCart() {
        cartRepo.getCart(userName: userName)
    }
    
    func addCartButton(foodName: String, foodImage: String, foodPrice: String, numberOfFood: Int) {
        cartRepo.addCart(foodName: foodName, foodImage: foodImage, foodPrice: Int(foodPrice)!, numberOfFood: numberOfFood, username: userName)
        getCart()
    }
    func deleteCartItem(id : Int) {
        cartRepo.deleteCartItem(foodId: id, userName: userName)
        getCart()
    }
    
    
}
