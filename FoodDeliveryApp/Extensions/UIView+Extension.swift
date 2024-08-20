//
//  UIView+Extension.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 19.07.2024.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        
           var parentResponder: UIResponder? = self
           while parentResponder != nil {
               parentResponder = parentResponder!.next
               if let viewController = parentResponder as? UIViewController {
                   return viewController
               }
           }
           return nil
       }
}
