//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Илья Федорченко on 29/12/2018.
//  Copyright © 2018 Илья Федорченко. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {
  
  var restaurants: [Restaurant] = [
    Restaurant(name: "Ogonek Grill&Bar", type: "ресторан", location: "Уфа, бульвар Хадии Давлетшиной, д.21", image: "ogonek", isVisited: false),
    Restaurant(name: "Елу", type: "ресторан", location: "1 Infinite Loop, Cupertino, CA", image: "elu", isVisited: false),
    Restaurant(name: "Bonsai", type: "ресторан", location: "Ufa", image: "bonsai", isVisited: false),
    Restaurant(name: "Дастархан", type: "ресторан", location: "Moscow", image: "dastarhan", isVisited: false),
    Restaurant(name: "Индокитай", type: "ресторан", location: "Москва", image: "indokitay", isVisited: false),
    Restaurant(name: "X.O", type: "ресторан-клуб", location: "Уфа", image: "x.o", isVisited: false),
    Restaurant(name: "Балкан Гриль", type: "ресторан", location: "Уфа", image: "balkan", isVisited: false),
    Restaurant(name: "Respublica", type: "ресторан", location: "Уфа", image: "respublika", isVisited: false),
    Restaurant(name: "Speak Easy", type: "ресторанный комплекс", location: "Уфа", image: "speakeasy", isVisited: false),
    Restaurant(name: "Morris Pub", type: "ресторан", location: "Уфа", image: "morris", isVisited: false),
    Restaurant(name: "Классик", type: "", location: "Уфа", image: "klassik", isVisited: false),
    Restaurant(name: "Вкусные истории", type: "ресторан", location: "Уфа", image: "istorii", isVisited: false),
    Restaurant(name: "Love&Life", type: "ресторан", location: "Уфа", image: "love", isVisited: false),
    Restaurant(name: "Шок", type: "ресторан", location: "Уфа", image: "shok", isVisited: false),
    Restaurant(name: "Бочка", type: "ресторан", location: "Уфа", image: "bochka", isVisited: false)
  ]
  
  @IBAction func close(segue:UIStoryboardSegue) {
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.hidesBarsOnSwipe = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.estimatedRowHeight = 85
    tableView.rowHeight = UITableView.automaticDimension
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return restaurants.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
    
    cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
    cell.thumbnailImageView.layer.cornerRadius = 32.5
    cell.thumbnailImageView.clipsToBounds = true
    
    cell.nameLabel.text = restaurants[indexPath.row].name
    cell.locationLabel.text = restaurants[indexPath.row].location
    cell.typeLabel.text = restaurants[indexPath.row].type
    
    cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
    
    return cell
  }
  
  func showAlert(indexPath: IndexPath, table: UITableView) {
    let ac = UIAlertController(title: nil, message: "Choose action", preferredStyle: .actionSheet)
    let isVisitedTitle = restaurants[indexPath.row].isVisited ? "I was not here" : "I was here"
    let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) {_ in
      let cell = table.cellForRow(at: indexPath)
      self.restaurants[indexPath.row].isVisited.toggle()
      cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
    }
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    let call = UIAlertAction(title: "Call: +7(495)111-111\(indexPath.row)", style: .default) {_ in
      let ac = UIAlertController(title: nil, message: "Phone call unavailable", preferredStyle: .alert)
      let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
      ac.addAction(ok)
      self.present(ac, animated: true, completion: nil)
    }
    
    ac.addAction(call)
    ac.addAction(isVisited)
    ac.addAction(cancel)
    
    present(ac, animated: true, completion: nil)
  }
  
  //  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  //    showAlert(indexPath: indexPath, table: tableView)
  //
  //    tableView.deselectRow(at: indexPath, animated: true)
  //
  //  }
  
  override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
    let share = UITableViewRowAction(style: .default, title: "Share") {(action, indexPath) in
      let defaultText = "I'm at the " + self.restaurants[indexPath.row].name
      if let image = UIImage(named: self.restaurants[indexPath.row].image) {
        let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
      }
    }
    
    let delete = UITableViewRowAction(style: .default, title: "Delete") {
      (action, indexPath) in
      self.restaurants.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    delete.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    
    return [delete, share]
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "detailSegue" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let dvc = segue.destination as! EateryDetailViewController
        dvc.restaurant = restaurants[indexPath.row]
      }
    }
  }
  
}
