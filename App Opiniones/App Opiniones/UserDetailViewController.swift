//
//  UserDetailViewController.swift
//  App Opiniones
//
//  Created by Paula on 17/4/21.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userDetailImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var numberMessagesLabel: UILabel!
    @IBOutlet weak var changePhotoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userDetailImageView.layer.cornerRadius = 120
        
        // TODO: habilitar el botón cuando el usuario pueda cambiar o no la foto
        changePhotoLabel.text = "Cambiar foto"
        
        // TODO: recuperar el nombre del usuario
        userNameLabel.text = "AitorTilla"
        
        // TODO: recuperar la fecha
        creationDateLabel.text = "Creado el 01/01/2020"
        
        // TODO: recuperar el número de mensajes
        numberMessagesLabel.text = "140 mensajes"
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
