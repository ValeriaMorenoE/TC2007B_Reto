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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/YYYY"
        let dateString = dateFormatter.string(from: calendario.date)
        dateTextField.text = dateString
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func updatePrice(_ sender: Any) {
        let numBoletos = Double(cantTickets.text ?? "") ?? 0 * 40
        precio.text = String(numBoletos)
    }
    
    @IBAction func pagar(_ sender: UIButton) {
        
    }
    
    @IBAction func selectDate(_ sender: Any) {
        calendario.isHidden = true
        calendario.isEnabled = false
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/YYYY"
        let dateString = dateFormatter.string(from: calendario.date)
        dateTextField.text = dateString
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
