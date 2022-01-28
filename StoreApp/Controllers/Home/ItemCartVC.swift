//
//  ItemCartVC.swift
//  API-Request AlamoFire
//
//  Created by Mostafa on 12/5/21.
//

import UIKit
import Alamofire


class ItemCartVC: UIViewController {
    
    @IBOutlet weak var priceLbl :UILabel!
    @IBOutlet weak var tableView :UITableView!
    var index :String!
    var price :Double?
    var home :HomeVC?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("The Price Item Indexx = \(index)")
        priceLbl.text = index
        
    }
    
}
