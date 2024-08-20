//
//  CustomTabBaarController.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 19.07.2024.
//

import UIKit

class CustomTabBaarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        custom()
    }
    
    private func setup() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let homeNavController = storyboard.instantiateViewController(identifier: "HomeNavController") as! UINavigationController
        let homeVC = homeNavController.topViewController as! HomeVC
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let likeNavController = storyboard.instantiateViewController(identifier: "LikeNavController") as! UINavigationController
        let likeVC = likeNavController.topViewController as! LikesVC
        likeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        let profileNavController = storyboard.instantiateViewController(withIdentifier: "ProfileNavController") as! UINavigationController
        let profileVC = profileNavController.topViewController as! ProfileVC
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        let cartNavController = storyboard.instantiateViewController(withIdentifier: "CartNavController") as! UINavigationController
        let cartVC = cartNavController.topViewController as! CartVC
        cartVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        

        
        viewControllers = [homeNavController,likeNavController,profileNavController,cartNavController]
        
    }
    
    static func badgeCount(number: Int) -> Int {
        return number
    }
    
    private func custom() {
        
        tabBar.backgroundColor = UIColor(named: "MainColor")
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "MainColor")
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    
}
