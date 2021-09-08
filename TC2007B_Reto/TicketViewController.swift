//
//  TicketViewController.swift
//  TC2007B_Reto
//
//  Created by Alumno on 08/09/21.
//

import UIKit

class TicketViewController: UIViewController {
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var cantTickets: UITextField!
    @IBOutlet weak var precio: UITextField!
    
    @IBOutlet weak var calendario: UIDatePicker!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pagar(_ sender: UIButton) {
        let numBoletos = Double(cantTickets.text ?? "") ?? 0 * 40
        precio.text = String(numBoletos)
    }
    
    @IBAction func openCalendar(_ sender: Any) {
        calendario.isHidden = false
        calendario.isEnabled = true
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
