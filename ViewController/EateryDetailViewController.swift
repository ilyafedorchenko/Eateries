//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Илья Федорченко on 31/12/2018.
//  Copyright © 2018 Илья Федорченко. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  var restaurant: Restaurant?
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.hidesBarsOnSwipe = false
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    imageView.image = UIImage(named: restaurant!.image)
//    tableView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
//    tableView.separatorColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    title = restaurant!.name
    
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
    
    switch indexPath.row {
    case 0:
      cell.keyLabel.text = "Назавание"
      cell.valueLabel.text = restaurant!.name
    case 1:
      cell.keyLabel.text = "Тип"
      cell.valueLabel.text = restaurant!.type
    case 2:
      cell.keyLabel.text = "Адрес"
      cell.valueLabel.text = restaurant!.location
    case 3:
      cell.keyLabel.text = "Я там был?"
      cell.valueLabel.text = restaurant!.isVisited ? "Да" : "Нет"
    default:
      break
    }
    
    cell.backgroundColor = UIColor.clear
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
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
