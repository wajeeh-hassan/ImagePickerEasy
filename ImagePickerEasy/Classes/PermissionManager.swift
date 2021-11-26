//
//  extentions.swift
//  ImagePickerEasy
//
//  Created by wajeeh hassan on 26/11/2021.
//

import Foundation
import UIKit
import AVFoundation

extension ImagePickerEasy{
    
    func checkImageAccessPermission() {
        
        var isAllow = true
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
            //already authorized
            isAllow = true
            print("Camera allow already")
            presentMenu()

        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    //access allowed
                    isAllow = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.presentMenu()
                    }
                    
                } else {
                    //access denied
                    isAllow = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.askUserForPermission()
                    }
                    
                }
            })
        }
        print(isAllow)
    }
    
    
    func askUserForPermission() {
        
        let alertController = UIAlertController (title: "Access Camera", message: "Would you like to access Camera for image sharing ?", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                    })
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        presentationController!.present(alertController, animated: true, completion: nil)
    }
}
