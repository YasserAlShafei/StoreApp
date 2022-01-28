//
//  LoginVC.swift
//  API-Request AlamoFire
//
//  Created by Mostafa on 12/4/21.
//

import UIKit
import Alamofire


class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTF :UITextField!
    @IBOutlet weak var passwordTF :UITextField!
    private var usernameUsers :[String] = []
    private var passwordUsers :[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //loadRequest()
        print(usernameUsers)
        
    }
    
    
    
    // -----------------------------------------------------------------------------------
    @IBAction func signInBtn(_ sender :Any) {
        loadRequest()
    }
    
    private func loadRequest() {
        OperationsAPI.getUsers() { response, error in
            if error == nil {
                guard let data = response else { return }
                
                let usernamee = self.usernameTF.text
                let passwordd = self.passwordTF.text
                
                for dic in data {
                    let username = dic["username"] as! String
                    let password = dic["password"] as! String
                    self.usernameUsers.append(username)
                    self.passwordUsers.append(password)
                }
                print("Array of Emails Users: \(self.usernameUsers)")
                print("Array of Passwords Users: \(self.passwordUsers)")
                
                if (usernamee != "" && passwordd != "") {
                    if let index = self.usernameUsers.firstIndex{$0 == usernamee} {
                        if passwordd == self.passwordUsers[index] {
                            //self.showMessage(title: "Sucess", message: "True Operation Entered")
                            let vc = self.storyboard!.instantiateViewController(identifier: "SourceTC") as! SourceTC
                            self.show(vc, sender: nil)
                        }else{
                            self.showMessage(title: "Error", message: "False Operation Entered")
                        }
                    }
                }else{
                    self.showMessage(title: "Error", message: "Please Enter Data")
                }
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    
    
    
    func showMessage(title :String, message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
