//
//  ShoppingCartVC.swift
//  API-Request AlamoFire
//
//  Created by Mostafa on 12/5/21.
//

import UIKit
import Alamofire


class ShoppingCartVC: UIViewController {

    @IBOutlet weak var tableView :UITableView!
    var ids :[Int] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadRequest()
    }
    
    
    
    @IBAction func deleteBtn(_ sender: Any) {
        OperationsAPI.getCarts { response, error in
            if error == nil {
                guard let data = response else { return }
                print(data)
                for dic in data {
                    let id = dic["id"] as! Int
                    self.ids.append(id)
                }
                
                if(self.ids.contains(self.index)){
                    
                }
                
                self.tableView.reloadData()
            }else{
                print(error?.localizedDescription)
            }
        }
    }

    private func restRequest(url:String, method: String, params: [String: String], completion: @escaping ([AnyObject])->() ){
        if let nsURL = NSURL(string:url) {
            let request = NSMutableURLRequest(url: nsURL as URL)
            if method == "POST" {
                // convert key, value pairs into param string
                let postString = params.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
                request.httpMethod = "POST"
                request.httpBody = postString.data(using: String.Encoding.utf8)
            }
            else if method == "GET" {
                let postString = params.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
                request.httpMethod = "GET"
            }
            else if method == "PUT" {
                let putString = params.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
                request.httpMethod = "PUT"
                request.httpBody = putString.data(using: String.Encoding.utf8)
            }
            else if method == "DELETE" {
                let putString = params.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
                request.httpMethod = "DELETE"
                request.httpBody = putString.data(using: String.Encoding.utf8)
            }
            // Add other verbs here

            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                (data, response, error) in
                do {

                    // what happens if error is not nil?
                    // That means something went wrong.

                    // Make sure there really is some data
                    if let data = data {
                        let response = try JSONSerialization.jsonObject(with: data, options:  JSONSerialization.ReadingOptions.mutableContainers)
                        completion(response as! [AnyObject])
                    }
                    else {
                        // Data is nil.
                    }
                } catch let error as NSError {
                    print("json error: \(error.localizedDescription)")
                }
            }
            task.resume()
        }
        else{
            // Could not make url. Is the url bad?
            // You could call the completion handler (callback) here with some value indicating an error
        }
    }
    
    private func loadRequest() {
        OperationsAPI.getCarts() { response, error in
            if error == nil {
                guard let data = response else { return }
                print(data)
                for dic in data {
                    let id = dic["id"] as! Int
                    self.ids.append(id)
                }
                self.tableView.reloadData()
            }else{
                print(error?.localizedDescription)
            }
        }
    }
}





extension ShoppingCartVC :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellShopping") as! CartItemTVC
        self.index = indexPath.row
        cell.id.text = String(ids[indexPath.row])
        return cell
    }
}
