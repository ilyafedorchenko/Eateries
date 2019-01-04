//
//  NewEateryTableViewController.swift
//  Eateries
//
//  Created by Илья Федорченко on 03/01/2019.
//  Copyright © 2019 Илья Федорченко. All rights reserved.
//

import UIKit

class NewEateryTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var adressTextField: UITextField!
  @IBOutlet weak var typeTextField: UITextField!
  @IBOutlet weak var yesButton: UIButton!
  @IBOutlet weak var noButton: UIButton!
  
  @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    if nameTextField.text == "" || adressTextField.text == "" || typeTextField.text == "" {
      print("Some fields are empty")
    } else {
      performSegue(withIdentifier: "unwindSegueFromNewEatery", sender: self)
    }
  }
  
  @IBAction func toggleIsVisitedPressed(_ sender: UIButton) {
    if sender == yesButton{
      sender.backgroundColor = #colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)
      noButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    } else {
      sender.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
      yesButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    imageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    dismiss(animated: true, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      let alertController = UIAlertController(title: "Image source", message: nil, preferredStyle: .actionSheet)
      let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {(action) in
        self.chooseImagePickerAction(source: .camera)
      })
      let photoLibAction = UIAlertAction(title: "Photo Library", style: .default, handler: {(action) in
        self.chooseImagePickerAction(source: .photoLibrary)
      })
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      
      alertController.addAction(cameraAction)
      alertController.addAction(photoLibAction)
      alertController.addAction(cancelAction)
      present(alertController, animated: true, completion: nil)
    }
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func chooseImagePickerAction(source: UIImagePickerController.SourceType) {
    if UIImagePickerController.isSourceTypeAvailable(source) {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      imagePicker.sourceType = source
      present(imagePicker, animated: true, completion: nil)
      
    }
  }
  
}
