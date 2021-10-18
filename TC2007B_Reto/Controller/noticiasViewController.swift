//
//  noticiasViewController.swift
//  TC2007B_Reto
//
//  Created by Ruben Robles on 10/13/21.
//

import UIKit

class noticiasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var noticias: [Noticia] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "newCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "shakira_cell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 270
        
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    func fetchData(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/news", method: .get, parameters: nil, stringParameters: nil) {
            (event: [Noticia]?, error) in
            if error != nil{
                print(error ?? "Error al hacer request")
            } else {
                guard let not = event else {return}
                self.noticias = not
                self.tableView.reloadData()
                print("Got data")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shakira_cell") as! newCellTableViewCell
        cell.title.text = noticias[indexPath.row].title.trimmingCharacters(in: .newlines)
        cell.subtitle.text = noticias[indexPath.row].subtitle.trimmingCharacters(in: .newlines)
        cell.date.text = noticias[indexPath.row].date.trimmingCharacters(in: .newlines)
        cell.newsDescription.text = noticias[indexPath.row].description.trimmingCharacters(in: .newlines)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let VC = expoVC(nibName: "expoVC", bundle: nil)
//        VC.expo = expos[indexPath.row]
//
//        present(VC, animated: true, completion: nil)
//
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

//        if(cell.newsDescription.intrinsicContentSize.height > 57){
//
//            return 270-57+cell.newsDescription.intrinsicContentSize.height
//
//        }
       return UITableView.automaticDimension
    }
}
