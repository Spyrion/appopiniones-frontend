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
    var connection = Connection()
    var listaUsuarios : [User]?
    
    
    
    @IBOutlet weak var NombreUsuario: UITextField!
    @IBOutlet weak var Contrasena: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        connection.getUsuarios() { user in
            self.listaUsuarios = user?.listaUsuarios
        }
        
        Session.current.userName = "User"
        Session.current.token = "onetoken"
        Session.save()        // Do any additional setup after loading the view.
    }
    
    @IBAction func InicioSesion(_ sender: Any) {
        var validate = 0
        
        for i in listaUsuarios!{
            if i.username == NombreUsuario.text && i.password == Contrasena.text{
                validate+=1
                id=i.id
            }
        }
        if validate == 1 {
            
        }else{
            
        }
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
