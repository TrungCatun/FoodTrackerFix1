//
//  ViewController.swift
//  FoodTrackerFix1
//
//  Created by Trung on 9/12/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self // xu ly thong tin nguoi dung tai text field
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func setDefaultLabelText(_ sender: Any) {
//        mealNameLabel.text = "Default Text"
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text =  textField.text
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController() // cho nguoi dung chon anh tu thu vien
        imagePickerController.sourceType = .photoLibrary // chi cho phep chon anh, ko chon anh
        imagePickerController.delegate = self   // thong bao cho viewcontroller khi nguoi dung chon anh
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // khi nguoi dung chuan bi chon anh ma cancel thi huy luon ham chon anh
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // func cho phep lam cai gi do sau khi chon dc anh
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage // tao mot tu dien chua anh dc chon
             else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
}

