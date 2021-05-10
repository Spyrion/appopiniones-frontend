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
    
    var token = ""
    var Login = LoginViewController()
    var Register = RegisterViewController()
    var username : String = ""
    var password : String = ""
    var confirmpassword : String = ""
    var connection = Connection()
    let optionKey = "OptionKey"
    let baseURLStringUsuarios = "localhost:8080/api/usuarios/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.token = "\(Login.token)"
        
        username = String(UsernameField.text ?? "")
        password = String(PasswordField.text ?? "")
        ConfirmPasswordField.text = confirmpassword
     

        connection.getDataAjustes(withId: Register.id ?? 0 )
        
        if let switchValue = UserDefaults.standard.value(forKey: optionKey) as? Bool {
            
            SwitchMessages.isOn = switchValue
        } else {
            
            SwitchMessages.isOn = false
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
                        "username" = \(username) ,
                        "password" = \(password) ,
                        }

                        """
        if (ConfirmPasswordField.text != PasswordField.text) {
            print("Contraseñas no coincidentes")
            
        }
        
        // funcion PUT para ajustes
        
        func putAjustes(withId id: Int, params: [AnyHashable: Any], completion: @escaping (_ user: User?) -> Void ) {
            guard let urlDataAjustes = URL(string: baseURLStringUsuarios + "\(id)/") else {
               completion(nil)
               return
               
           }
                      var requestPUT = URLRequest(url: urlDataAjustes)
                         requestPUT.httpMethod = "PUT"
                         requestPUT.addValue("application/json", forHTTPHeaderField: "content-type")
                         requestPUT.httpBody = try? JSONEncoder().encode(jsonObject)
            
            
            

            }
        }
        
    
    
    @IBAction func Logout(_ sender: Any) {
        
        self.token = ""
        
        
    }


}

extension AjustesViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let imageNew = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            UserImage.image = imageNew
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
