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

    // Falta recuperar los datos que manda la pantalla anterior
    var id = ""
    var name = "AitorTilla"
    var creationDate = "01/01/2020"
    var numberMessages = 20

    
    override func viewDidLoad() {
        super.viewDidLoad()

        userDetailImageView.layer.cornerRadius = 120
        
        userNameLabel.text = "\(self.name)"
        creationDateLabel.text = "Creado el \(self.creationDate)"
        numberMessagesLabel.text = "\(self.numberMessages) mensajes"
        // FALTA userDetailImageView
    }

}
