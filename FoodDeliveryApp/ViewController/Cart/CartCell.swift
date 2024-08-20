//
//  CartCell.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 3.07.2024.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numberOfFoodLabel: UILabel!
    @IBOutlet weak var piecePriceLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    
    var viewModel = CartViewModel()
    var cartId : Int?
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        viewModel.deleteCartItem(id: cartId!)
        viewModel.getCart()
    }
    
}
