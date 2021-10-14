//
//  TicketRestaurantController.swift
//  TC2007B_Reto
//
//  Created by Alumno on 08/09/21.
//

import UIKit

class TicketRestaurantController: UIViewController {
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var calendar: UIDatePicker!
    @IBOutlet weak var calendarContainer: UITableViewCell!
    @IBOutlet weak var cantNiños: UITextField!
    @IBOutlet weak var cantAdultos: UITextField!
    @IBOutlet weak var cantAdultosMayores: UITextField!
    @IBOutlet weak var precio: UILabel!
    
    
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
        let numNiños = Int(cantNiños.text ?? "") ?? 0
        let numAdultos = Int(cantAdultos.text ?? "") ?? 0
        let numAdultosMayores = Int(cantAdultosMayores.text ?? "") ?? 0
        precio.text = "$" + String((numNiños+numAdultosMayores)*10+numAdultos*40)
    }
    func post(){
        NetworkManager.postData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/reserve", method: .get, parameters: nil, stringParameters: nil) {
            (event: [Expo]?, error) in
            if error != nil{
                print(error ?? "Error al hacer request")
            } else {
                guard let expos = event else {return}
                self.expos = expos
                self.tableView.reloadData()
                print("Got data")
            }
        }
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
