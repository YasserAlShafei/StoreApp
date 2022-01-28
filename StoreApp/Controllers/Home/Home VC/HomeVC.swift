//
//  ViewController.swift
//  API-Request AlamoFire
//
//  Created by Mostafa on 12/1/21.
//

import UIKit
import Alamofire


class HomeVC: UIViewController {

    @IBOutlet weak var collectionView :UICollectionView!
    private var itemsPrice :[String] = []
    var priceCat :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // ..
        loadRequest()
        collectionView.reloadData()
        
    }
    
    
    
    private func loadRequest() {
        OperationsAPI.getProducts() { response, error in
            if error == nil {
                guard let data = response else { return }
                print(data)
                for dic in data {
                    let price = dic["price"] as! Double
                    self.itemsPrice.append(String(price))
                    self.collectionView.reloadData()
                }
                
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? ItemCartVC {
            if let index = sender as? String {
                print("The Price Item = \(index)")
                des.index = index
            }
        }
    }
}






extension HomeVC :UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsPrice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellHome", for: indexPath) as! CategoryCVC
        cell.title.text = itemsPrice[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.priceCat = String(indexPath.row)
        let item = itemsPrice[indexPath.row]
        print("The Price Item = \(item)")
        performSegue(withIdentifier: "ShowProduct", sender: item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2)-37, height: 281)
    }
}

