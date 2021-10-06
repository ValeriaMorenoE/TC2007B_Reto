//
//  Museo3dViewController.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 08/09/21.
//

import UIKit

class Museo3dViewController: UIViewController {
    @IBOutlet weak var menuButton: UIButton!
    
    @IBAction func goBack(_ sender: Any) {
        let homeStoryBoard = UIStoryboard(name: "Menu", bundle: nil)
        let vc = homeStoryBoard.instantiateViewController(identifier: "MainMenuViewController") as! MenuViewController
        
        vc.modalPresentationStyle = .currentContext
        self.present(vc, animated: true, completion: nil)
    }
}
