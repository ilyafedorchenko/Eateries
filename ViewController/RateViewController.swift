//
//  RateViewController.swift
//  Eateries
//
//  Created by Илья Федорченко on 02/01/2019.
//  Copyright © 2019 Илья Федорченко. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
  
  @IBOutlet weak var ratingStackView: UIStackView!
  @IBOutlet weak var badButton: UIButton!
  @IBOutlet weak var goodButton: UIButton!
  @IBOutlet weak var brilliantButton: UIButton!
  var restRating: String?
  
  @IBAction func rateRestaurant (sender: UIButton) {
    switch sender.tag {
    case 0: restRating = "bad"
    case 1: restRating = "good"
    case 2: restRating = "brilliant"
    default: break
    }
    
    performSegue(withIdentifier: "unwindSegueToDVC", sender: sender)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = self.view.bounds
    blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    self.view.insertSubview(blurEffectView, at: 1)
    
    badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
    goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
    brilliantButton.transform = CGAffineTransform(scaleX: 0, y: 0)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    let buttons = [badButton, goodButton, brilliantButton]
    for (index, button) in buttons.enumerated() {
      let delay = Double(index) * 0.2
      UIView.animate(withDuration: 1.2, delay: delay, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        button?.transform = CGAffineTransform(scaleX: 1, y: 1)
      }, completion: nil)
    }
  }
}
