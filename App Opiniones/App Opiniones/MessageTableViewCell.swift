//
//  MessageTableViewCell.swift
//  App Opiniones
//
//  Created by user181456 on 5/13/21.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var messageUser: UILabel!
    @IBOutlet weak var buttonDeleteMessage: UIButton!
    @IBOutlet weak var buttonEditMessage: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
