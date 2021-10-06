//
//  HistorialViewController.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 09/09/21.
//

import UIKit

class HistorialViewController: UIViewController {
    @IBOutlet weak var ticketsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HistorialTableViewCell", bundle: nil)
        ticketsTable.register(nib, forCellReuseIdentifier: "historialCell")
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
