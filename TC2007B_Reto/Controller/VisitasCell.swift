//
//  VisitasCell.swift
//  TC2007B_Reto
//
//  Created by Alumno on 20/10/21.
//

import UIKit

class VisitasCell: UITableViewCell {

    @IBOutlet weak var ReservarView: UIView! {
        didSet{
            ReservarView.isHidden = true
        }
    }
    @IBOutlet weak var fechaVisita: UILabel!
    @IBOutlet weak var guiaVisita: UILabel!
    @IBOutlet weak var numPersonasVisita: UITextField!
    @IBOutlet weak var botonReservarVisita: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
