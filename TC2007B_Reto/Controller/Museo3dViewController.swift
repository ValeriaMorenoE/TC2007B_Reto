//
//  Museo3dViewController.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 08/09/21.
//

import UIKit
import WebKit

class Museo3dViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        let url = URL(string: "https://www.patiomarco.360s.mx")!
        webView.load(URLRequest(url: url))
    }
    @IBAction func goBack(_ sender: Any) {
        let homeStoryBoard = UIStoryboard(name: "Menu", bundle: nil)
        let vc = homeStoryBoard.instantiateViewController(identifier: "MainMenuViewController") as! MenuViewController
        
        vc.modalPresentationStyle = .currentContext
        self.present(vc, animated: true, completion: nil)
    }
}
