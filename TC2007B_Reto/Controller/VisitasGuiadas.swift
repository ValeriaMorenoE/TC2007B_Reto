//
//  VisitasGuiadas.swift
//  TC2007B_Reto
//
//  Created by Alumno on 20/10/21.
//

import UIKit

class VisitasGuiadas: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableVisitas: UITableView!
    var visitas: [Visita] = []
    var loadedCell: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVisitas.delegate = self
        tableVisitas.dataSource = self
        let nib = UINib(nibName: "VisitasCell", bundle: nil)
        tableVisitas.register(nib, forCellReuseIdentifier: "visitas_cell")
        
        fetchData()

        // Do any additional setup after loading the view.
    }

    func fetchData(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/visits", method: .get, parameters: nil, stringParameters: nil) {
            (event: [Visita]?, error) in
            if error != nil{
                print(error ?? "Error al hacer request")
            } else {
                guard let vis = event else {return}
                self.visitas = vis
                self.tableVisitas.reloadData()
                print("Got data")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visitas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVisitas.dequeueReusableCell(withIdentifier: "visitas_cell") as! VisitasCell
        cell.fechaVisita.text = visitas[indexPath.row].date
        cell.guiaVisita.text = visitas[indexPath.row].guide
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableVisitas.cellForRow(at: indexPath) as! VisitasCell
        UIView.animate(withDuration: 0.3){
            cell.ReservarView.isHidden = !cell.ReservarView.isHidden
            print(cell.ReservarView.isHidden)
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

//        if(cell.newsDescription.intrinsicContentSize.height > 57){
//
//            return 270-57+cell.newsDescription.intrinsicContentSize.height
//
//        }
        return UITableView.automaticDimension
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
