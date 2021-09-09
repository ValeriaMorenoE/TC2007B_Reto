//
//  TicketRestaurantController.swift
//  TC2007B_Reto
//
//  Created by Alumno on 08/09/21.
//

import UIKit

class TicketRestaurantController: UIViewController {
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var cantTickets: UITextField!
    @IBOutlet weak var precio: UITextField!
    @IBOutlet weak var calendar: UIDatePicker!
    @IBOutlet weak var calendarContainer: UITableViewCell!
    
    override func viewDidLoad() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/YY"
//        let dateString = dateFormatter.string(from: calendar.date)
//        dateText.text = dateString
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
//    @IBAction func openCalendar(_ sender: UITextField) {
//        calendarContainer.isHidden = false
//        calendar.isEnabled = true
//    }
    
//    @IBAction func selectDate(_ sender: Any) {
//        calendarContainer.isHidden = true
//        calendar.isEnabled = false
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/YY"
//        let dateString = dateFormatter.string(from: calendar.date)
//        dateText.text = dateString
//    }
    
    @IBAction func updatePrice(_ sender: Any) {
        let numBoletos = Int(cantTickets.text ?? "") ?? 0
        precio.text = "$" + String(numBoletos * 40)
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
