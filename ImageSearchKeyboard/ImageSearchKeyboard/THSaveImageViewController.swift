//
//  THSaveImageViewController.swift
//  ImageSearchKeyboard
//
//  Created by TomofumiHamada on 2016/09/11.
//  Copyright © 2016年 htomcat. All rights reserved.
//

import UIKit

class THSaveImageViewController: UIViewController {

    // MARK: - Properties
    var imagePicker = UIImagePickerController()
    
    @IBAction func touchedSaveImageButton(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - UIImagePickerControllerDelegate
extension THSaveImageViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        
        guard let imagePngData = UIImagePNGRepresentation(image) else {
            return
        }
        
        let imageData = NSData(data: imagePngData)
        
        let defaults = UserDefaults.init(suiteName: "group.userImage")

        defaults?.set(imageData, forKey: "SampleImage")
    }
}

// MARK: - UINavigationControllerDelegate
extension THSaveImageViewController: UINavigationControllerDelegate {
    
}

