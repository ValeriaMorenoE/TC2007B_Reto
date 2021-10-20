//
//  expoVC.swift
//  TC2007B_Reto
//
//  Created by user190339 on 9/9/21.
//

import UIKit

class expoVC: UIViewController {
    
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var fechaLbl: UILabel!
    @IBOutlet weak var salasLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var cerraduriaLbl: UILabel!
    @IBOutlet weak var museografiaLbl: UILabel!
    
    var expo: Expo!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloLbl.text = expo.title
        fechaLbl.text = expo.startDate
        salasLbl.text = expo.salas
        descLbl.text = expo.description
        cerraduriaLbl.text = "Curaduría: " + expo.cerraduria
        museografiaLbl.text = "Museografía: " + expo.museografia

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
