//
//  MenuViewController.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 08/09/21.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var userTxtField: UILabel!
    
    @IBOutlet weak var exposicionesButton: UIButton!
    @IBOutlet weak var reservacionesButton: UIButton!
    @IBOutlet weak var boletosButton: UIButton!
    @IBOutlet weak var museo3dButton: UIButton!
    @IBOutlet weak var misComprasButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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
        // hacia exposiciones
    }
    @IBAction func reservacionesButtonPressed(_ sender: Any) {
        // hacia reservaciones de restaurante
    }
    @IBAction func boletosButtonPressed(_ sender: Any) {
        // hacia compra de boletos
    }
    @IBAction func museo3dButtonPressed(_ sender: Any) {
        // hacia museo 3D
    }
    @IBAction func misComprasButtonPressed(_ sender: Any) {
        // hacia boletos y reservaciones comprados
    }
    
    
}
