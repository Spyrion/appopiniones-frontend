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
    @IBOutlet weak var GuardarDatos: UIButton!
    
    var token = ""
    
    var Login = LoginViewController()
    var connection = Connection()
    
    var username : String = ""
    var password : String = ""
    var confirmpassword : String = ""
    
  
    let optionKey = "OptionKey"
    let baseURLStringUsuarios = "localhost:8080/api/usuarios/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.token = "\(Login.token)"
        GuardarDatos.isEnabled = true
        
        connection.getDataAjustes(withId: Login.id ?? 0){ user in

            self.username = user?.username ?? ""
            self.password = user?.password ?? ""
        }
        
        ConfirmPasswordField.text = String(PasswordField.text ?? "")
        
        if let switchValue = UserDefaults.standard.value(forKey: optionKey) as? Bool {
            
            SwitchMessages.isOn = switchValue
        } else {
            
            SwitchMessages.isOn = false
        }
        
        UsernameField.text = username
        PasswordField.text = password
        ConfirmPasswordField.text = password
        confirmpassword = password
    
    
    if (ConfirmPasswordField.text != PasswordField.text) {
        
        GuardarDatos.isEnabled = false
        
    } else {
        
        GuardarDatos.isEnabled = true
    }
        
        
    }
    
    @IBAction func switchvalueChanged (_ sender : UISwitch){
        UserDefaults.standard.setValue(sender.isOn, forKey: optionKey)
    }
    
    @IBAction func ChangePhoto(_ sender: Any) {
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
 
    }
    
    @IBAction func Save(_ sender: Any) {
        
        
        let jsonObject = """

                        {
                        "username" = "\(username)" ,
                        "password" = "\(password)" ,
                        }

                        """
      
        // funcion PUT para ajustes
        
        func putAjustes(withId  id : Int = Login.id ?? 0  ,  params: [AnyHashable: Any], completion: @escaping (_ user: User?) -> Void ) {
            guard let urlDataAjustes = URL(string: baseURLStringUsuarios + "\(id)/") else {
               completion(nil)
               return
               
           }
            var requestPUT = URLRequest(url: urlDataAjustes , cachePolicy: .useProtocolCachePolicy , timeoutInterval:  10 )
                         requestPUT.httpMethod = "PUT"
                         requestPUT.addValue("application/json", forHTTPHeaderField: "Content-type")
                         requestPUT.httpBody = try? JSONEncoder().encode(jsonObject)
            
            
            }
        
        
        }
        
    
    
    @IBAction func Logout(_ sender: Any) {
        
        self.token = ""
        
        
    }


}

extension AjustesViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
                                [UIImagePickerController.InfoKey : Any]) {
        
        
        if let imageNew = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as?
            UIImage {
            UserImage.image = imageNew
         
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

