//
//  ViewController.swift
//  ImagePickerEasy
//
//  Created by wajeehulhassan on 11/26/2021.
//  Copyright (c) 2021 wajeehulhassan. All rights reserved.
//

import UIKit
import ImagePickerEasy

class ViewController: UIViewController {

    @IBOutlet weak var mImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func pickImageAction(_ sender: Any) {
        
        ImagePickerEasy.shared.present(from: sender as! UIView, vc: self) { image in
            if image != nil{
                self.mImageView.image = image
            }
        }
    }
    
    
    
}

















