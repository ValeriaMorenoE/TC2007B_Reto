//
//  expoMenuViewController.swift
//  TC2007B_Reto
//
//  Created by Alumno on 08/09/21.
//

import UIKit

class expoMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        let nib = UINib(nibName: "expoViewCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "expoCell")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expoCell") as! expoViewCellTableViewCell
        
        if indexPath.row == 0 {
            cell.expoThumbnail.image = UIImage(named: "thumbnail1")
            cell.expoName.text = "Index Marco"
            cell.expoDates.text = "12 de Junio 2021"
        } else {
            cell.expoThumbnail.image = UIImage(named: "thumbnail2")
            cell.expoName.text = "La Poética del Regreso"
            cell.expoDates.text = "12 de Marzo 2021"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = expoVC(nibName: "expoVC", bundle: nil)
        
        present(VC, animated: true, completion: nil)
        
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
