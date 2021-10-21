//
//  eventosViewController.swift
//  TC2007B_Reto
//
//  Created by Alumno on 18/10/21.
//

import UIKit

class eventosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mainFrameImg: UIImageView!
    @IBOutlet weak var blackImg: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    var eventos : [Evento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //mainFrameImg.dropShadow(scale: false)
        
        tableView.delegate = self
        tableView.dataSource = self
        mainFrameImg.layer.cornerRadius = 10
        mainFrameImg.clipsToBounds = true
        mainFrameImg.backgroundColor = UIColor.white
        blackImg.layer.cornerRadius = 10
        blackImg.layer.masksToBounds = false
        blackImg.clipsToBounds = false
        blackImg.addShadowToView(shadow_color: UIColor.black, offset: CGSize(width: 0, height: 0), shadow_radius: 8.0, shadow_opacity: 0.5, corner_radius: 10.0)
//        mainFrameImg.layer.shadowColor = UIColor.black.cgColor
//        mainFrameImg.layer.shadowOffset = CGSize(width: 3, height: 3)
//        mainFrameImg.layer.shadowOpacity = 0.7
//        mainFrameImg.layer.shadowRadius = 4.0
//        mainFrameImg.layer.backgroundColor = UIColor.black.cgColor
//        mainFrameImg.layer.opacity = 0.55
        fetchData()
    }
    
    func fetchData() {
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/events", method: .get, parameters: nil, stringParameters: nil) { (event: [Evento]?, error) in
            if error != nil {
                print(error!)
            } else {
                guard let eventos = event else {return}
                self.eventos = eventos
                self.tableView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        eventos[section].date
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        eventos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventos[section].events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = eventos[indexPath.section].events[indexPath.row]
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "eventCell")
        cell.textLabel?.text = event
        
        return cell
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
