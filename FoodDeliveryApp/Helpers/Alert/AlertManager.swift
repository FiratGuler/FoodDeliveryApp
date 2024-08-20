//
//  AlertManager.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 18.07.2024.
//

import UIKit

class AlertManager {
    static func showAlert(message: String?, from viewController: UIViewController) {
        
        let alertView = AlertView(message: message)
        
        let width = viewController.view.bounds.size.width
        let heigth = viewController.view.bounds.size.height * 0.05
        //let heigth = 300.0
        
        guard let navigationBar = viewController.navigationController?.navigationBar else {
            return
        }
        
        let navigationBarBottomY = navigationBar.frame.maxY
        let alertViewY = navigationBarBottomY + 10
        
        
        alertView.frame = CGRect(x: 0, y: alertViewY, width: width, height: heigth)
    
        viewController.view.addSubview(alertView)
        
    }
}
