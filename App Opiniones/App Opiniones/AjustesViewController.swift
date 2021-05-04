//
//  AjustesViewController.swift
//  App Opiniones
//
//  Created by user185160 on 4/19/21.
//

import UIKit

class AjustesViewController: UIViewController {

    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ConfirmPasswordField: UITextField!
    @IBOutlet weak var SwitchMessages: UISwitch!
    
    var token: String = ""
    var connection = Connection()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let idNuestro : Int = 3
        connection.getDataAjustes(withId: idNuestro, method: <#T##String#>, params: <#T##[AnyHashable : Any]#>, completion: <#T##(DataAjustes?) -> Void#>)
    
}
    
    @IBAction func ChangePhoto(_ sender: Any) {
    }
    
    @IBAction func Save(_ sender: Any) {
        
    }
    
    @IBAction func Logout(_ sender: Any) {
        
    }
    
    
    
    
   
    

   

}
