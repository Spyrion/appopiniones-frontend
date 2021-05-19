//
//  RegisterViewController.swift
//  App Opiniones
//
//  Created by user185160 on 4/19/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var token = ""
    var id :Int?
    
    @IBOutlet weak var BtnRegistro: UIButton!
    
    @IBOutlet weak var NombreUsuario: UITextField!
    @IBOutlet weak var Contrasena: UITextField!
    @IBOutlet weak var ConfirmContrasena: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func guardarUsuario() {
        let baseURLUsuario = "localhost:8080/api/usuarios/"
        // Comprobar que existan los varios datos introducidos y si están vacíos
        if let nombreUsuario = self.NombreUsuario.text, !nombreUsuario.isEmpty,
        let contrasena = self.Contrasena.text, !contrasena.isEmpty {
            let dataFormatter = DateFormatter()
            dataFormatter.dateStyle = .short
            dataFormatter.timeStyle = .none
            let date = Date()
            let creationDate = dataFormatter.string(from: date)
            let jsonObject = """

                                    {
                                    "username" = "\(nombreUsuario)" ,
                                    "password" = "\(contrasena)" ,
                                    "photo" = null,
                                    "messages" = 0,
                                    "creationDate" = "\(creationDate)",
                                    "mensajes" = null,
                                    "temas" = null,    }

                                    """
            
                  
    // Funcion POST del objeto JSON a la URL
    func postUsuario( params: [AnyHashable: Any], completion: @escaping (_ user: User?) -> Void ) {
                            guard let urlDataAjustes = URL(string: baseURLUsuario) else {
                                completion(nil)
                               return
                               
                           }
                            var requestPOST = URLRequest(url: urlDataAjustes , cachePolicy: .useProtocolCachePolicy , timeoutInterval:  10 )
                                         requestPOST.httpMethod = "POST"
                                         requestPOST.addValue("application/json", forHTTPHeaderField: "content-type")
                                         requestPOST.httpBody = try? JSONEncoder().encode(jsonObject)
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
    }
           
    @IBAction func EnviarRegistro(_ sender: Any) {
                if Contrasena == ConfirmContrasena{
                    
                    guardarUsuario()
                }
            
        }
            
}
