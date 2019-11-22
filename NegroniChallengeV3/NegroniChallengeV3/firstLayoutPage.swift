//
//  firstLayoutPage.swift
//  NegroniChallengeV3
//
//  Created by Chiara Pellecchia on 21/11/2019.
//  Copyright © 2019 Chiara Pellecchia. All rights reserved.
//

import Foundation
import UIKit

class firstLayoutPage: UIViewController{
    
   var imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var backBut: UIButton!
    @IBOutlet weak var pickBut: UIButton!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            imagePicker.delegate = self
            // Do any additional setup after loading the view.
        
        }
    
    @IBOutlet weak var city: UITextField!
    
   
    @IBOutlet weak var descr: UITextField!
    
    @IBOutlet weak var monthyear: UITextField!
    
    @IBAction func doneButton(_ sender: Any) {
        
        let imageData = (image1.image?.pngData())!
        let cityInput: String = city.text!
        let dateInput: String = city.text!
        let descInput: String = descr.text!

        CoreDataController.shared.addTrip(title: cityInput, creationData: dateInput, photo: imageData)
        CoreDataController.shared.addPage(date: dateInput, desc: descr, photo: imageData)
    }
    
    @IBOutlet weak var newImageIcon: UIImageView!
    
            
        @IBOutlet weak var image1: UIImageView!
        
        

      @IBAction func pickButton(_ sender: Any) {
            imagePicker.sourceType = .photoLibrary
            //imagePicker.allowsEditing = true
            present(imagePicker,animated: true,completion: nil)
            image1.backgroundColor = .clear
            newImageIcon.isHidden = true
        
    }
}


    extension firstLayoutPage: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        func imagePickerController( _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]){
            
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                image1.image = image
            }
            dismiss(animated: true, completion: nil)
        }
        
        
        
        
        
             
    }
