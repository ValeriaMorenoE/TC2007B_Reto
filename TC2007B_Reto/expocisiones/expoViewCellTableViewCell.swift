//
//  expoViewCellTableViewCell.swift
//  TC2007B_Reto
//
//  Created by Alumno on 08/09/21.
//

import UIKit

class expoViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var expoThumbnail: UIImageView!
    @IBOutlet weak var expoName: UILabel!
    @IBOutlet weak var expoDates: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
