//
//  UserDetailViewController.swift
//  App Opiniones
//
//  Created by Paula on 17/4/21.
//

import UIKit

class UserDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userDetailImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var numberMessagesLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        userDetailImageView.layer.cornerRadius = 120
        
        
        
        // TODO: recuperar el nombre del usuario
        userNameLabel.text = "AitorTilla"
        
        // TODO: recuperar la fecha
        creationDateLabel.text = "Creado el 01/01/2020"
        
        // TODO: recuperar el número de mensajes
        numberMessagesLabel.text = "140 mensajes"
    }
    


}
