//
//  expoMenuViewController.swift
//  TC2007B_Reto
//
//  Created by Alumno on 08/09/21.
//

import UIKit

class expoMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var frameImg: UIImageView!
    @IBOutlet weak var frameImgColor: UIView!
    
    var expos: [Expo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        frameImg.layer.cornerRadius = 10
        //frameImgColor.dropShadow()
        frameImgColor.layer.cornerRadius = 10
        
        let nib = UINib(nibName: "expoViewCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "expoCell")
        
        // Do any additional setup after loading the view.
        
        fetchData()
    }
    
    func fetchData(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/expositions", method: .get, parameters: nil, stringParameters: nil) {
            (event: [Expo]?, error) in
            if error != nil{
                print(error ?? "Error al hacer request")
            } else {
                guard let expos = event else {return}
                self.expos = expos
                self.tableView.reloadData()
                //print("Got data")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "exposicion")
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        
        //cell.expoThumbnail.image = UIImage(named: "thumbnail1")
        cell.textLabel?.text = expos[indexPath.row].title
        
        
        //let date = formatter.date(from: e)
        
        let dateFormatterGet = DateFormatter()
           dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .medium
           dateFormatter.timeStyle = .none
           //    dateFormatter.locale = Locale(identifier: "en_US") //uncomment if you don't want to get the system default format.

           let dateObj: Date? = dateFormatterGet.date(from: expos[indexPath.row].startDate)
        print(dateFormatter.string(from: dateObj!))
        
        //cell.detailTextLabel?.text = formatter.string(from: date)
        cell.detailTextLabel?.text = dateFormatter.string(from: dateObj!)
        
        return cell
    }
    
    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 200
    //}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = expoVC(nibName: "expoVC", bundle: nil)
        VC.expo = expos[indexPath.row]
        
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
