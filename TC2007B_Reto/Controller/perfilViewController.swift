//
//  perfilViewController.swift
//  TC2007B_Reto
//
//  Created by Alumno on 20/10/21.
//

import UIKit
import Firebase

class perfilViewController: UIViewController {

    @IBOutlet weak var PreguntasFrecuentes: UIButton!
    @IBOutlet weak var Historial: UIButton!
    @IBOutlet weak var Quejas: UIButton!
    @IBOutlet weak var Contacto: UIButton!
    @IBOutlet weak var EditarPerfil: UIButton!
    @IBOutlet weak var userDisplayName: UILabel!
    
    @IBOutlet weak var Logout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        userDisplayName.text = user?.displayName
        
        Logout.layer.cornerRadius = 15
        
        PreguntasFrecuentes.contentHorizontalAlignment = .left
        PreguntasFrecuentes.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        PreguntasFrecuentes.imageEdgeInsets = UIEdgeInsets(top: 3, left: 310, bottom: 0, right: 0)
    
        Historial.clipsToBounds = true
        Historial.layer.cornerRadius = 10
        Historial.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        Historial.contentHorizontalAlignment = .left
        Historial.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        Historial.imageEdgeInsets = UIEdgeInsets(top: 3, left: 310, bottom: 0, right: 0)
        
        Quejas.contentHorizontalAlignment = .left
        Quejas.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        Quejas.imageEdgeInsets = UIEdgeInsets(top: 3, left: 310, bottom: 0, right: 0)
        
        Contacto.contentHorizontalAlignment = .left
        Contacto.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        Contacto.imageEdgeInsets = UIEdgeInsets(top: 3, left: 310, bottom: 0, right: 0)
        
        EditarPerfil.clipsToBounds = true
        EditarPerfil.layer.cornerRadius = 10
        EditarPerfil.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        EditarPerfil.contentHorizontalAlignment = .left
        EditarPerfil.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        EditarPerfil.imageEdgeInsets = UIEdgeInsets(top: 3, left: 310, bottom: 0, right: 0)
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        do {
            try? Auth.auth().signOut()
        }
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
