//
//  OperationsAPI.swift
//  API-Request AlamoFire
//
//  Created by Mostafa on 12/3/21.
//

import Foundation
import Alamofire



class OperationsAPI {
    
    /* // ---------------------------------------------------------------------------------------
     
     // Requests
     1- login
     2- Home
     3- item cart home
     4- delete cart
     5- details item cart home
     5- add to cart **
     
     
     AF.request("\(Network.Carts_URL)").responseJSON { response in
     
         switch response.result {
         case .success(let result):
             print(result)
         case .failure(let error):
             print(error.localizedDescription)
         }
     }
     
    */ // ---------------------------------------------------------------------------------------
    
    
    static func getCategories(handler: @escaping ([String]?, Error?) -> Void) {
        AF.request("\(Network.API.Categories_URl)").responseJSON { response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode([String].self, from: data)
                    handler(res, nil)
                    print(res)
                }
                catch{
                    handler(nil, error)
                    print(error)
                }
            }
        }
    }
    
    
    static func loginUser() {
        AF.request("\(Network.API.LOGIN_URL)", method: .post).responseJSON { response in
            
        }
    }
    
    
    static func getUsers(handler: @escaping ([[String:Any]]?, Error?) -> Void) {
        AF.request("\(Network.API.Users_URL)").responseJSON { response in
            //debugPrint(response)
            
            switch response.result {
            case .success(let data):
                print("Validation Successful")
                let dic = data as! [[String:Any]]
                handler(dic, nil)
            case .failure(let error):
                print(error.localizedDescription)
                handler(nil, error)
            }
        }
    }
    
    /* - Request by used URL-Session -------------------------------------------------------------
    func getUsers() {
        URLSession.shared.dataTask(with: URL(string: "\(Network.API.Users_URL)")!) { (data, response, error) in
            if error != nil {
                print("Error: \(error.debugDescription)")
                print("Error: \(error?.localizedDescription)")
            }else{
                print(data?.description)
                do{
                    let arrayObject = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
                    for dic in arrayObject {
                        let email = dic["email"] as! String
                        let password = dic["password"] as! String
                        self.emailUsers.append(email)
                        self.passwordUsers.append(password)
                    }
                    //print("Array of Objects: \(arrayObject)")
                    print("Array of Emails Users: \(self.emailUsers)")
                    print("Array of Passwords Users: \(self.passwordUsers)")
                }catch let error {
                    print(error)
                }
                
            }
        }.resume()
    }
     
    */ // -----------------------------------------------------------------------------------
    
    
    
    static func getProducts(handler: @escaping ([[String:Any]]?, Error?) -> Void) {
        AF.request("\(Network.API.Products_URL)", method: .get).responseJSON { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                print("Validation Successful")
                let dic = data as! [[String:Any]]
                handler(dic, nil)
            case .failure(let error):
                print(error.localizedDescription)
                handler(nil, error)
            }
            
        }
    }
    
    
    
    
    static func getSingleProduct(index :Int? ,handler: @escaping ([String:Any]?, Error?) -> Void) {
        AF.request("\(Network.API.Products_URL)\(String(index ?? 0))", method: .get).responseJSON { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                print("Validation Successful")
                let dic = data as! [String:Any]
                handler(dic, nil)
            case .failure(let error):
                print(error.localizedDescription)
                handler(nil, error)
            }
            
        }
    }

    
    
    
    static func getCarts(handler: @escaping ([[String:Any]]?, Error?) -> Void) {
        AF.request("\(Network.API.Carts_URL)", method: .get).responseJSON { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                print("Validation Successful")
                let dic = data as! [[String:Any]]
                handler(dic, nil)
            case .failure(let error):
                print(error.localizedDescription)
                handler(nil, error)
            }
            
        }
    }
    
    
    
    
    static func deleteItemCart() {
        AF.request("\(Network.API.Carts_URL)", method: .delete).responseJSON { response in
            
        }
    }
    
}

