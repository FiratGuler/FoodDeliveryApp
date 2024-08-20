//
//  CartVC.swift
//  FoodOrderApp
//
//  Created by Fırat Güler on 11.06.2024.
//

import UIKit

import Kingfisher
import RxSwift

class CartVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var footerView: UIView!
    
    var viewModel = CartViewModel()
    var cartArray = [CartModel]() {
        didSet {
            cartArrayFilter()
            totalPriceCalc()
        }
    }
    var filteredCartArray = [CartModel]()
    var totalPriceResult = 0
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getCart()
    }
    
    //MARK: - Functions
    
    private func setup() {
        
        tableView.delegate = self
        tableView.dataSource = self
        footerSetup()
        
        viewModel.cartList
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {  list in
                self.cartArray = list
                self.tableView.reloadData()
                self.updateBadge()
            })
            .disposed(by: disposeBag)
        
        viewModel.getCart()
    }
    
    private func footerSetup() {
        footerView.layer.borderColor = UIColor(named: "MainColor")?.cgColor
        footerView.layer.borderWidth = 1
        footerView.layer.cornerRadius = 10
        footerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
    }
    
    private func updateBadge() {
        if let tabBarItem = self.tabBarController?.tabBar.items?[3] {
            tabBarItem.badgeValue = "\(self.cartArray.count)"
        }
    }
    
    private func totalPriceCalc() {
        totalPriceResult = 0
        for i in filteredCartArray {
            if let foodPrice = Int(i.foodPrice ?? "0"), let numberOfFood = Int(i.numberOfFood ?? "0") {
            
                    let top = foodPrice * numberOfFood
                    totalPriceResult += top
               
            }
        }
    }
    
    private func cartArrayFilter() {
        
        var prevName = Set<String>()
        
        prevName.removeAll()
        filteredCartArray.removeAll()
        
        for item in cartArray {
           
            guard let foodName = item.foodName else {
                continue
            }
            if !prevName.contains(foodName) {
                print("döngü : \(foodName)")
                prevName.insert(foodName)
                filteredCartArray.append(item)
            }
        }
    
        let duplicateItems = Dictionary(grouping: cartArray, by: { $0.foodName })
            .filter { $1.count > 0 }
            .mapValues{ $0.count }
        
                for (foodName, count) in duplicateItems {
                    for i in 0..<filteredCartArray.count {
                        if filteredCartArray[i].foodName == foodName {
                            
                            if let piece = Int(filteredCartArray[i].numberOfFood!) {
                                if count != 1 || piece != 1 {
                                    let operation = count + piece - 1
                                    filteredCartArray[i].numberOfFood! = String(operation)
                                }
                            }
                    
                        }
        
                    }
                }
    }
}

//MARK: - Extensions

extension CartVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCartArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartCell
        
        let name = filteredCartArray[indexPath.row].foodName
        let image = filteredCartArray[indexPath.row].foodImage
        let price = filteredCartArray[indexPath.row].foodPrice
        let piece = filteredCartArray[indexPath.row].numberOfFood
        let operations = Int(price!)! * Int(piece!)!
      
        
        cell.selectionStyle = .none
       

           
        
        
        
        
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(image!)")
        DispatchQueue.main.async {
            cell.foodImage.kf.setImage(with: url)
        }
        cell.foodNameLabel.text = name
        cell.priceLabel.text = "\(price!) ₺"
        cell.numberOfFoodLabel.text = piece
        cell.piecePriceLabel.text = "\(operations) ₺"
        self.totalPriceLabel.text = "\(totalPriceResult) ₺"
        
        if let cartId = filteredCartArray[indexPath.row].cartId {
            cell.cartId = Int(cartId)
          
        }
        
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
        
        return cell
    }
    
    @objc private func deleteButtonAction() {
        viewModel.getCart()
        self.totalPriceCalc()
    }
    
}
