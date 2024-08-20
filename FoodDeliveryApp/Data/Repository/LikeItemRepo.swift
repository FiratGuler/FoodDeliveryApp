//
//  LikeRepo.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 20.07.2024.
//

import Foundation

class LikeItemRepo {
    static let shared = LikeItemRepo()
    
    private let defaults = UserDefaults.standard
    private let likedItemKeys = "likedItems"
    
    
    func getLikedItems() -> [LikeItemModel]{
        
        if let data = defaults.data(forKey: likedItemKeys) {
            if let items = try? JSONDecoder().decode([LikeItemModel].self, from: data) {
                return items
            }
        }
        return []
    }
    
    func saveLikedItem(item: LikeItemModel) {
        
        var items = getLikedItems()
        items.append(item)
        
        if let encoded = try? JSONEncoder().encode(items){
            defaults.set(encoded, forKey: likedItemKeys)
        }
    }
    
    func removeLikedItem (at index : Int) {
        var items = getLikedItems()
        items.remove(at: index)
        
        if let encoded = try? JSONEncoder().encode(items) {
            defaults.set(encoded, forKey: likedItemKeys)
        }
    }
}
