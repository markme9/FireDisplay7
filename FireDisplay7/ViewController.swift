//
//  ViewController.swift
//  FireDisplay7
//
//  Created by mark me on 6/24/20.
//  Copyright © 2020 mark me. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var array = [AddModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    @IBAction func nextScreen(_ sender: Any)
        
    {
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let nextVC = segue.destination as? MyProfilePage {
                nextVC.delegate = self
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyTableViewCell
        
        cell.profileImage.image = array[indexPath.row].image
        cell.nameLabel.text = array[indexPath.row].field1
        cell.phoneNumber.text = array[indexPath.row].field2
        cell.emailIdLabel.text = array[indexPath.row].field3
        
        return cell
    }
    
}

extension ViewController:AddModelProtocol {
    func didAddToArray(didAdd: AddModel) {
        
        array.append(didAdd)
        self.tableView.reloadData()
        
    }
    
}

