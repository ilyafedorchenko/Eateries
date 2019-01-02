//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Илья Федорченко on 31/12/2018.
//  Copyright © 2018 Илья Федорченко. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var rateButton: UIButton!
  @IBOutlet weak var mapButton: UIButton!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!

  @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    guard let svc = segue.source as? RateViewController else { return }
    guard let rating = svc.restRating else { return }
    rateButton.setImage(UIImage(named: rating), for: .normal)
  }
  
  var restaurant: Restaurant?
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.hidesBarsOnSwipe = false
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    let buttons = [rateButton, mapButton]
    for button in buttons {
      guard let button = button else {break}
      button.layer.cornerRadius = 5
      button.layer.borderWidth = 1
      button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    tableView.estimatedRowHeight = 38
    tableView.rowHeight = UITableView.automaticDimension
    
    imageView.image = UIImage(named: restaurant!.image)
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

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "mapSegue" {
      let dvc = segue.destination as! MapViewController
      dvc.restaurant = restaurant
    }
  }
}
