//
//  Museo3dViewController.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 08/09/21.
//

import UIKit
import WebKit

class Museo3dViewController: UIViewController {
    
    var link: String?
    @IBOutlet weak var wevView: WKWebView!
    
    override func viewDidLoad() {
        guard let url = URL(string: link ?? "https://www.museomarco.360s.mx") else {return}
        //let configuration = WKWebViewConfiguration()
        //configuration.allowsInlineMediaPlayback = true
        wevView.load(URLRequest(url: url))
    }
    
}
