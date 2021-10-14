//
//  ViewController.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 24/08/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showHome(_ sender: Any) {
        guard let email = userTxtField.text, email != "" else {
            displayAlert(title: "Error", message: "El email no es valido")
            return
        }
        
        guard let password = passTxtField.text, email != "" else {
            displayAlert(title: "Error", message: "El email no es valido")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.displayAlert(title: "Error", message: error?.localizedDescription ?? "")
                print(error)
            } else {
                print("Sesion Iniciada \(authResult?.user.uid ?? "")")
            }
        }
        
        //let homeStoryBoard = UIStoryboard(name: "Menu", bundle: nil)
        //let vc = homeStoryBoard.instantiateViewController(identifier: "MainMenuViewController") as! MenuViewController
        
        //vc.modalPresentationStyle = .currentContext
        //self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func showSignUp(_ sender: Any) {
        let signup = SignUpVC(nibName: "SignUpVC", bundle: nil)
        signup.modalPresentationStyle = .fullScreen
        signup.modalTransitionStyle = .crossDissolve
        self.present(signup, animated: true, completion: nil)
    }
    
    
}

