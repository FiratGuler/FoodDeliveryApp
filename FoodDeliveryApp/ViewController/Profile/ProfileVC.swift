//
//  SettingsVC.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 10.07.2024.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var profilPhoto: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var editProfileView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ProfileViewModel()
    var menuList = [ProfileModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        
        for item in viewModel.menuItems {
            menuList.append(item)
        }
        
        self.navigationController?.navigationBar.tintColor = UIColor(named: "MainColor")
        tableView.backgroundColor = UIColor(named: "FadedColor")?.withAlphaComponent(0.2)
        
    }
}

extension ProfileVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCell
        cell.menuNameLabel.text = menuList[indexPath.row].menuName
        cell.menuIconImage.image = UIImage(systemName:  menuList[indexPath.row].iconName)
        
        cell.selectionStyle = .none
        
        return cell
    }
  
    

}
