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
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
      
      // move the root view up by the distance of keyboard height
      self.view.frame.origin.y = 0 - keyboardSize.height
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
    
    
    
}

