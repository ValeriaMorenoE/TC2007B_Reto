//
//  MenuViewController.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 08/09/21.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    @IBOutlet weak var userTxtField: UILabel!
    
    @IBOutlet weak var exposicionesButton: UIButton!
    @IBOutlet weak var reservacionesButton: UIButton!
    @IBOutlet weak var boletosButton: UIButton!
    @IBOutlet weak var museo3dButton: UIButton!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var misComprasButton: UIButton!
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        guard let email = Auth.auth().currentUser?.displayName else { return }
        welcomeLbl.text = "Bienvenido \(email)"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupViews() {
        exposicionesButton.layer.cornerRadius = 20
        exposicionesButton.clipsToBounds = true
        
        reservacionesButton.layer.cornerRadius = 20
        reservacionesButton.clipsToBounds = true
        
        boletosButton.layer.cornerRadius = 20
        boletosButton.clipsToBounds = true
        
        museo3dButton.layer.cornerRadius = 20
        museo3dButton.clipsToBounds = true
        
        misComprasButton.layer.cornerRadius = 20
        misComprasButton.clipsToBounds = true
    }
    
    @IBAction func exposicionesButtonPressed(_ sender: Any) {
        let exposiciones = expoMenuViewController(nibName: "expoMenuViewController", bundle: nil)
        self.navigationController?.pushViewController(exposiciones, animated: true)
    }
    
    @IBAction func reservacionesButtonPressed(_ sender: Any) {
        let reservar = RestaurantViewController(nibName: "RestaurantViewController", bundle: nil)
        self.navigationController?.pushViewController(reservar, animated: true)
    }
    @IBAction func boletosButtonPressed(_ sender: Any) {
        // hacia compra de boletos
        let comprarBoletos = TicketRestaurantController(nibName: "TicketRestaurantController", bundle: nil)
        self.navigationController?.pushViewController(comprarBoletos, animated: true)
    }
    @IBAction func museo3dButtonPressed(_ sender: Any) {
        // hacia museo 3D
        let museo3dStoryboard = UIStoryboard(name: "Museo3d", bundle: nil)
        let vc = museo3dStoryboard.instantiateViewController(identifier: "Museo3dViewController") as! Museo3dViewController
        
        //vc.modalPresentationStyle = .currentContext
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func misComprasButtonPressed(_ sender: Any) {
        // hacia boletos y reservaciones comprados
        let historial = noticiasViewController(nibName: "noticiasViewController", bundle: nil)
        historial.modalPresentationStyle = .fullScreen
        //self.navigationController?.pushViewController(historial, animated: true)
        self.present(historial, animated: true, completion: nil)
    }
    @IBAction func logOutButtonPressed(_ sender: Any) {
        do {
            try? Auth.auth().signOut()
        }
    }
    
    
}
