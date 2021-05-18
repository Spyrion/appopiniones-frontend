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
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userDetailImageView.layer.cornerRadius = 120
        
        if let username = user?.username, let userimage = user?.photo, let creationDate = user?.creationDate, let messages = user?.messages {
            
            let dataFormatter = DateFormatter()
            dataFormatter.dateStyle = .short
            dataFormatter.timeStyle = .none
            let creationDateString = dataFormatter.string(for: creationDate)
            
            userNameLabel.text = username
            userDetailImageView.image = UIImage(named: userimage)
            creationDateLabel.text = "Creado el \(creationDateString ?? "")"
            numberMessagesLabel.text = "\(String(messages)) mensajes"
        }
    }
}
