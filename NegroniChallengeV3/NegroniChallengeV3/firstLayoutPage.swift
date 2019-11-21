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
    
    
    @IBOutlet weak var pickBut: UIButton!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            imagePicker.delegate = self
            // Do any additional setup after loading the view.
            

        }
    
    
    
        
            
        @IBOutlet weak var image1: UIImageView!
        
        

      @IBAction func pickButton(_ sender: Any) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker,animated: true,completion: nil)
            image1.backgroundColor = .clear
            pickBut.isHidden = true
        
    }
}


    extension firstLayoutPage: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        func imagePickerController( _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]){
            
            if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                image1.image = image
            }
            dismiss(animated: true, completion: nil)
        }
        
        
        
             
    }
