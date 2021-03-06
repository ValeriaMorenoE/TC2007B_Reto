//
//  expoVC.swift
//  TC2007B_Reto
//
//  Created by user190339 on 9/9/21.
//

import UIKit
import WebKit

class expoVC: UIViewController {
    
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var fechaLbl: UILabel!
    @IBOutlet weak var salasLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var cerraduriaLbl: UILabel!
    @IBOutlet weak var museografiaLbl: UILabel!
    @IBOutlet weak var imagenImg: UIImageView!
    @IBOutlet weak var imgContainer: UIView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var recorridoBtn: UIButton!
    
    var expo: Expo!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloLbl.text = expo.title
        fechaLbl.text = expo.startDate
        salasLbl.text = "Disponible en sala: " + expo.salas
        descLbl.text = expo.description
        cerraduriaLbl.text = "Curaduría: " + expo.cerraduria
        museografiaLbl.text = "Museografía: " + expo.museografia
        
        guard let url = URL(string: expo.photoUrl) else {return}
        imagenImg.load(url: url)
        
        guard let urlVideo = URL(string: expo.videoUrl ?? "") else {return}
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        //webView.
        webView.load(URLRequest(url: urlVideo))
        
    }

    @IBAction func abrir3D(_ sender: Any) {
        let museo3dStoryboard = UIStoryboard(name: "Museo3d", bundle: nil)
        
        let vc = museo3dStoryboard.instantiateViewController(identifier: "Museo3dViewController") as! Museo3dViewController
        
        vc.link = expo.recorridoVirtual
        
        present(vc, animated: true, completion: nil)
    }
    

}
