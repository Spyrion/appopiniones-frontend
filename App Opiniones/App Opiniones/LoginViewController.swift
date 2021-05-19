//
//  LoginViewController.swift
//  App Opiniones
//
//  Created by user185160 on 4/19/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    var token = ""
    var id :Int?
    
    @IBOutlet weak var NombreUsuario: UITextField!
    @IBOutlet weak var Contrasena: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Session.current.userName = "User"
        Session.current.token = "onetoken"
        Session.save()        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
