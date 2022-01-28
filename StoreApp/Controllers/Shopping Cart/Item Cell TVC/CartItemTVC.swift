//
//  CartItemTVC.swift
//  API-Request AlamoFire
//
//  Created by Mostafa on 12/5/21.
//

import UIKit


class CartItemTVC: UITableViewCell {

    @IBOutlet weak var imageUser :UIImageView!
    @IBOutlet weak var id :UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    
    @IBAction func deleteItem(_ sender :Any) {
        
    }

}
