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
    var RegisterId = RegisterViewController()
    let baseURLStringUsuarios = "localhost:8080/api/usuarios/"
    var username : String = ""
    var password : String = ""
    var confirmpassword : String = ""


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.token = "\(Login.token)"
        UsernameField.text = username
        PasswordField.text = password
        ConfirmPasswordField.text = confirmpassword
        
        let jsonObject = """

                        {
                        "username" = \(username) ,
                        "password" = \(password) ,
                        "photo"
                        }

                        """
        
     
    }
    func getDataAjustes(withId id: Int, params: [AnyHashable: Any], completion: @escaping (_ user: User?) -> Void ) {
    guard let urlDataAjustes = URL(string: baseURLStringUsuarios + "\(id)/") else {
        completion(nil)
        return
        
    }
        
        let urlSessionDataAjustes = URLSession(configuration: URLSessionConfiguration.default)

        let task = urlSessionDataAjustes.dataTask(with: urlDataAjustes) {
            data, response, error in

            if error == nil {
                 let user = User(withJsonData: data)
                 completion(user)
              } else {
              completion(nil)

              }
        }
        task.resume()
        }
    
    @IBAction func ChangePhoto(_ sender: Any) {
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func Save(_ sender: Any) {
        
       
        
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
