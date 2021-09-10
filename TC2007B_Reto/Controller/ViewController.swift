//
//  ViewController.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 24/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showHome(_ sender: Any) {
        
        let homeStoryBoard = UIStoryboard(name: "Menu", bundle: nil)
        let vc = homeStoryBoard.instantiateViewController(identifier: "MainMenuViewController") as! MenuViewController
        
        vc.modalPresentationStyle = .currentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func showSignUp(_ sender: Any) {
        let signup = SignUpVC(nibName: "SignUpVC", bundle: nil)
        self.present(signup, animated: true, completion: nil)
    }
    
    
}

