//
//  VisitasCell.swift
//  TC2007B_Reto
//
//  Created by Alumno on 20/10/21.
//

import UIKit
import Firebase

class VisitasCell: UITableViewCell {

    @IBOutlet weak var ReservarView: UIView! {
        didSet{
            ReservarView.isHidden = true
        }
    }
    @IBOutlet weak var fechaVisita: UILabel!
    @IBOutlet weak var guiaVisita: UILabel!
    @IBOutlet weak var numPersonasVisita: UITextField!
    @IBOutlet weak var visitaId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func post(param: [String: Any]){
        NetworkManager.postData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/reserve", parameters: param) {
            (result: String?, error) in
            if let result = result {
                print("success: \(result)")
                let alert = UIAlertController(title: result, message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            } else if let error = error {
                print("error: \(error.localizedDescription)")
            }
        }
    }
    @IBAction func botonReservarVisita(_ sender: Any) {
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        guard let userEmail = Auth.auth().currentUser?.email else { return }
        let numPersonas = Int(numPersonasVisita.text ?? "") ?? 0
        let id = visitaId.text
        post(param:
             ["userId": userID,
              "userEmail": userEmail,
              "visitId": id ?? "",
              "persons": numPersonas])
    }
    
}
