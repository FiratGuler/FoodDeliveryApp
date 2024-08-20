//
//  FoodRepo .swift
//  FoodOrderApp
//
//  Created by Fırat Güler on 11.06.2024.
//

import Foundation
import RxSwift
import Alamofire

class FoodRepo {
    
    var foodsArr = BehaviorSubject<[FoodModel]>(value: [FoodModel]())

    
    func getData() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
                
            if let data = response.data {
                
                do {
                    let result = try JSONDecoder().decode(FoodResultModel.self, from: data)
                    if let list = result.foods {
                        self.foodsArr.onNext(list)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
   
    
    
}
