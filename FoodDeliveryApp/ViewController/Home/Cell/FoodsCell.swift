//
//  FoodsCell.swift
//  FoodOrderApp
//
//  Created by Fırat Güler on 11.06.2024.
//

import UIKit

class FoodsCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var likesButton: UIButton!
    
    
    var homeModel = HomeViewModel()
    var choosedArr = [FoodModel]()
    
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        let color = homeModel.likesButtonClicked()
        likesButton.tintColor = color
    }
    
    
    @IBAction func addToCartClicked(_ sender: Any) {
        for i in choosedArr {
            homeModel.addCartButton(foodName: i.foodName!,
                                    foodImage: i.foodImage!,
                                    foodPrice: i.foodPrice!,
                                    numberOfFood: 1)
        }
        if let VC = parentViewController {
            AlertManager.showAlert(message: "Ürününüz Eklenmiştir.", from: VC)
        }

        
    }
    
   
}



