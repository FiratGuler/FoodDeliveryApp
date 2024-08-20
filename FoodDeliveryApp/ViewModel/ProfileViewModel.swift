//
//  SettingsViewModel.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 10.07.2024.
//

import Foundation

class ProfileViewModel {
    
    var menuItems = [ProfileModel]()
   
    init(){
        menuItems = [
            ProfileModel(iconName: "mappin.circle.fill", menuName: "Adreslerim"),
            ProfileModel(iconName: "creditcard.circle.fill", menuName: "Ödeme Yöntemlerim"),
            ProfileModel(iconName: "bell.circle.fill", menuName: "İletişim Tercihleri"),
            ProfileModel(iconName: "rectangle.and.pencil.and.ellipsis", menuName: "Email & Şifre Değişikliği"),
            ProfileModel(iconName: "questionmark.circle.fill", menuName: "Yardım"),
        ]
    }
    
    
}
