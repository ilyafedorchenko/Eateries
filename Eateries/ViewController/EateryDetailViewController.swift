//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Илья Федорченко on 31/12/2018.
//  Copyright © 2018 Илья Федорченко. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  var imageName = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()

    imageView.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
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
