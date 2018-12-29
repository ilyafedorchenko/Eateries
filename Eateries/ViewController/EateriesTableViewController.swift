//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Илья Федорченко on 29/12/2018.
//  Copyright © 2018 Илья Федорченко. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {

  let restaurantNames = ["Ogonek Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
  
  let restaurantImages = ["ogonek", "elu", "bonsai", "dastarhan", "indokitay", "x.o", "balkan", "respublika", "speakeasy", "morris", "istorii", "klassik", "love", "shok", "bochka"]
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
      
      cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
      cell.thumbnailImageView.layer.cornerRadius = 32.5
      cell.thumbnailImageView.clipsToBounds = true
      cell.nameLabel.text = restaurantNames[indexPath.row]
      
      

        return cell
    }
  
  func showAlert(index: Int) {
    let ac = UIAlertController(title: nil, message: "Choose action", preferredStyle: .actionSheet)
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let call = UIAlertAction(title: "Call: +7(495)111-111\(index)", style: .default, handler: {_ in
      let ac = UIAlertController(title: nil, message: "Phone call unavailable", preferredStyle: .alert)
      let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
      ac.addAction(ok)
      self.present(ac, animated: true, completion: nil)
    })
    
    ac.addAction(cancel)
    ac.addAction(call)
    
    present(ac, animated: true, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    showAlert(index: indexPath.row)
    
  }
  
  
}
