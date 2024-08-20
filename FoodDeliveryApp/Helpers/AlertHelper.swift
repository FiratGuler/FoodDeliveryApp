//
//  AlertHelper.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 18.07.2024.
//

import UIKit

class AlertHelper {
    
    static func showAlert(viewController : UIViewController , title : String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
}
