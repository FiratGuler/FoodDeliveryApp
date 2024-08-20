//
//  CartRepo.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 3.07.2024.
//

import Foundation
import RxSwift
import Alamofire

class CartRepo {
    
    var cartList = BehaviorSubject<[CartModel]>(value: [CartModel]())
    
    
    func getCart(userName : String) {
        let param : Parameters = ["kullanici_adi" : userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post ,parameters: param).response { response in
            
            
            if let data = response.data {
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    if jsonString.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        self.cartList.onNext([])
                    }
                    else {
                        do {
                            let result = try JSONDecoder().decode(CartResultModel.self, from: data)
                            
                            if let cartArr = result.cart {
                                self.cartList.onNext(cartArr)
                            }
                        }
                        catch {
                            print("Getcart Error: \(error)")
                        }
                        
                    }
                }
             
            }
        }
    }
    
    func addCart(foodName : String , foodImage : String , foodPrice : Int , numberOfFood : Int , username : String) {
        let param : Parameters = ["yemek_adi" : foodName,
                                  "yemek_resim_adi" : foodImage,
                                  "yemek_fiyat" : foodPrice,
                                  "yemek_siparis_adet" : numberOfFood,
                                  "kullanici_adi" : username ]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post, parameters: param).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(CRUDResult.self, from: data)
                    print("AddCart Success : \(result.success!)")
                    print("AddCart Message : \(result.message!)")
                }
                catch {
                    print("AddCart Error:\(error.localizedDescription)")
                }
            }
        }
    }
    
    func deleteCartItem (foodId : Int , userName : String) {
        
        let param : Parameters = ["sepet_yemek_id" : foodId ,"kullanici_adi" : userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post , parameters: param).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(CRUDResult.self, from: data)
                    print("DeleteCart Success : \(result.success!)")
                    print("DeleteCart Message : \(result.message!)")
                }
                catch {
                    print("DeleteCart Error:\(error.localizedDescription)")
                }
            }
        }
        
    }
    
}
