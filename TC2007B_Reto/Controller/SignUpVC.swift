//
//  SignUpVC.swift
//  SignUpVC
//
//  Created by Ruben Robles on 9/8/21.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confpassField: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
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
    
    

    @IBAction func signInBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        guard let email = userField.text, email != "" else {
            displayAlert(title: "Error", message: "El email no es valido")
            return
        }
        guard let password = passField.text, password != "" else {
            displayAlert(title: "Error", message: "El email no es valido")
            return
        }
        guard let name = nameField.text, name != "" else {
            displayAlert(title: "Error", message: "El nombre no es valido")
            return
        }
        guard let confPass = confpassField.text, confPass == password else {
            displayAlert(title: "Error", message: "Las contraseñas no coinciden")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.displayAlert(title: "Error", message: error?.localizedDescription ?? "")
                print(error)
            } else {
                print("Usuario Creado \(authResult?.user.uid ?? "")")
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges { error in
                    if error != nil {
                        self.displayAlert(title: "Error", message: error?.localizedDescription ?? "")
                        print("Algo paso")
                    }
                }
            }
        }
        
    }
}
