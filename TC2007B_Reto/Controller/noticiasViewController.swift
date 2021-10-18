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
        
        // Do any additional setup after loading the view.
        
        fetchData()
    }
    
    func fetchData(){
        NetworkManager.getExternalData(fileLocation: "https://pacific-inlet-83178.herokuapp.com/news", method: .get, parameters: nil, stringParameters: nil) {
            (event: [Noticia]?, error) in
            if error != nil {
                print(error ?? "Error al hacer request")
            } else  {
                guard let noticias = event else {return}
                self.noticias = noticias
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shakira_cell") as! newCellTableViewCell
        
        cell.titleCell.text = noticias[indexPath.row].title
        cell.dateCell.text = noticias[indexPath.row].date
        cell.descriptionCell.text = noticias[indexPath.row].description
        cell.subtitleCell.text = noticias[indexPath.row
        ].subtitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
}
