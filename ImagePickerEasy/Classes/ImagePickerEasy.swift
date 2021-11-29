
//
//  picker.swift
//  ImagePickerEasy
//
//  Created by wajeeh hassan on 26/11/2021.
//

import Foundation
import UIKit
import AVFoundation




open class ImagePickerEasy: NSObject {
    
    
    var completionHandler: ((UIImage?)->Void)?
    private var pickerController =  UIImagePickerController()
    internal weak var presentationController: UIViewController?
    private weak var fromView: UIView?
    public static let shared = ImagePickerEasy()

    
 
    public func present(from: UIView , vc  : UIViewController , completionHandler :@escaping ((UIImage?)->Void)) {

        self.fromView =  from
        self.presentationController = vc
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = false
        self.pickerController.mediaTypes = ["public.image"]
        self.completionHandler = completionHandler
        checkImageAccessPermission()
               
    }
    
    
   
    
    func presentMenu() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let action = self.action(for: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            if let view = fromView{
                alertController.popoverPresentationController?.sourceView = view
                alertController.popoverPresentationController?.sourceRect = view.bounds
                alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
                
            }
        }
        
        self.presentationController?.present(alertController, animated: true)
        
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    
       
    
}


