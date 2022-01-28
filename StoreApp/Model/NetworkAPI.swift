//
//  NetworkAPI.swift
//  API-Request AlamoFire
//
//  Created by Mostafa on 12/1/21.
//

import Foundation



class Network {
    
    struct API {
        static let MAIN_URL :String = "https://fakestoreapi.com/"
        static let LOGIN_URL :String = "\(MAIN_URL)auth/login"  //method: 'POST' -> username ,password
        static let Users_URL :String = "\(MAIN_URL)users/"
        static let Products_URL :String = "\(MAIN_URL)products/"
        static let Categories_URl :String = "\(MAIN_URL)products/categories"
        static let Carts_URL :String = "\(MAIN_URL)carts/" //method: 'DELETE'
    }
    
    struct Firebase {
    }
    
}
