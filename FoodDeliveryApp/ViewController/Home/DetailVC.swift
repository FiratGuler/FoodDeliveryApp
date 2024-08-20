//
//  DetailVC.swift
//  FoodOrderApp
//
//  Created by Fırat Güler on 11.06.2024.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var numberOfFoodLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likesButton: UIButton!
    
    var choosedFood : FoodModel?
    var model = HomeViewModel()
    var piece = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Buttons Events
    
    @IBAction func plusNumberClicked(_ sender: Any) {
        changeNumberOfFood(amount: 1)
        
        
    }
    @IBAction func minusNumberClicked(_ sender: Any) {
        changeNumberOfFood(amount: -1)
    }
    @IBAction func addToCartClicked(_ sender: Any) {
        guard let food = choosedFood, let name = food.foodName , let image = food.foodImage ,let price = food.foodPrice  else {return}
        model.addCartButton(foodName: name,
                           foodImage: image,
                           foodPrice: price,
                           numberOfFood: piece)
        AlertManager.showAlert(message: "Ürününüz Eklenmiştir.", from: self)
    }
    
    @IBAction func likesClicked(_ sender: UIButton) {
        let color  = model.likesButtonClicked()
        likesButton.tintColor = color
        
    }
    @IBAction func closeClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Functions
    
    private func setup() {
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(choosedFood?.foodImage ?? "ayran.png")")
        DispatchQueue.main.async {
            self.imageView.kf.setImage(with: url)
        }
        nameLabel.text = choosedFood?.foodName
        priceLabel.text = "\(choosedFood?.foodPrice ?? "null") ₺"
        
        foodPriceLabel.text = "\(choosedFood?.foodPrice ?? "null") ₺"
    }
    
    private func changeNumberOfFood (amount : Int) {
        
        guard let food = choosedFood, let foodPrice = food.foodPrice, let priceInt = Int(foodPrice) else { return }
        
        piece += amount
        piece = max(1, piece)

        let operation = priceInt * piece
        foodPriceLabel.text = "\(operation) ₺"
        numberOfFoodLabel.text = "\(piece)"
    }
    
    
}
