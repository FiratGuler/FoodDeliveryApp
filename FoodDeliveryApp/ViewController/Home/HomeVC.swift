//
//  ViewController.swift
//  FoodOrderApp
//
//  Created by Fırat Güler on 11.06.2024.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var foodsArray = [FoodModel]()
    var viewModel = HomeViewModel()
    var filteredArray = [FoodModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Functions
    private func setup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        
        _ = viewModel.foodsArr.subscribe(onNext: { list in
            self.foodsArray = list
            self.filteredArray = list
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
        
        searchBarSetup()
        collectionSetup()
        
        
    }
    
    private func searchBarSetup(){
        let mainColor = UIColor(named: "MainColor")
        let fadedColor = UIColor(named: "FadedColor")
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.layer.borderColor = fadedColor!.cgColor
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 10
            textField.clipsToBounds = true
            
            textField.textColor = mainColor
            
            
            textField.backgroundColor = fadedColor?.withAlphaComponent(0.2)
            
            textField.tintColor = mainColor
            
            if let leftView = textField.leftView as? UIImageView {
                leftView.image = UIImage(systemName: "magnifyingglass")
                leftView.tintColor = fadedColor
            }
        }
        searchBar.backgroundImage = UIImage()
        
    }
    
    private func collectionSetup(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.6)
        collectionView.collectionViewLayout = layout
    }
    
}
//MARK: - Extensions
extension HomeVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredArray.removeAll()
        
        if searchText.isEmpty {
            filteredArray = foodsArray
        } else {
            filteredArray = foodsArray.filter { $0.foodName!.contains(searchText) }
        }
        
        collectionView.reloadData()
    }
    
}

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = filteredArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FoodsCell
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.foodImage!)")
        DispatchQueue.main.async {
            cell.imageView.kf.setImage(with:url)
        }
        cell.foodNameLabel.text = food.foodName
        cell.priceLabel.text = "\(food.foodPrice!)₺"
        
        cell.choosedArr = [food]
        
        cell.cellView.layer.borderColor = UIColor(named: "FadedColor")?.cgColor
        cell.cellView.layer.borderWidth = 0.5
        cell.cellView.layer.cornerRadius = 10.0
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 4
        cell.layer.masksToBounds = false
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let choosed = foodsArray[indexPath.row]
        
        performSegue(withIdentifier: "toDetailVC", sender: choosed)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let food = sender as? FoodModel {
                let destination = segue.destination as! DetailVC
                destination.choosedFood = food
            }
        }
    }
    
}

