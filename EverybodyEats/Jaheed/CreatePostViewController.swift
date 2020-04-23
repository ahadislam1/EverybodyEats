//
//  DetailViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import FirebaseFirestore

enum Location {
    case on
    case off
}

class CreatePostViewController: UIViewController {
    
    @IBOutlet weak var sharePostImageView: UIImageView!
    
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var locationOnOffLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    private let dbService = PostDatabaseService.helper
    //private let storageService = StorageService()
    
    private var imageURL: URL!
    
    private lazy var imagePickerController: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self // confomrm to UIImagePickerContorllerDelegate and UINavigationControllerDelegate
        return picker
    }()
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
      let gesture = UILongPressGestureRecognizer()
      gesture.addTarget(self, action: #selector(showPhotoOptions))
      return gesture
    }()
    
    private var selectedImage: UIImage? {
        didSet {
            sharePostImageView.image = selectedImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add long press gesture to itemImageView
        sharePostImageView.isUserInteractionEnabled = true
        sharePostImageView.addGestureRecognizer(longPressGesture)
        
        
    }
    
    @objc private func showPhotoOptions() {
        let alertController = UIAlertController(title: "Choose Photo Option", message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { alertAction in
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true)
        }
        
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { alertAction in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alertController.addAction(cameraAction)
        }
        alertController.addAction(photoLibrary)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction func sharePostPressed(_ sender: UIButton) {
        sender.isEnabled = false
        guard let caption = captionTextField.text,
         let selectedImage = selectedImage else {
            showAlert(title: "Missing Photo", message: "Oops...You must upload a photo")
            sender.isEnabled = true
            return
        }
        
        let user = User.jaheed
        let id = UUID().uuidString
        StorageService.helper.uploadPhoto(id: id, experience: .post, imageURL: imageURL) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Error", message: error.localizedDescription)
            case .success(let url):
                let post = Post(id: id, imageURL: url.absoluteString, caption: caption, userHandle: user.displayName, userId: user.id, allergen: [""])
                PostDatabaseService.helper.createPost(post: post) { [weak self] result in
                    switch result {
                    case .failure(let error):
                        self?.showAlert(title: "Error", message: error.localizedDescription)
                    case .success:
                        break
                    }
                }
            }
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    
//    private func uploadPhoto(photo: UIImage, documentId: String) {
//      storageService.uploadPhoto(itemId: documentId, image: photo) { [weak self] (result) in
//        switch result {
//        case .failure(let error):
//          DispatchQueue.main.async {
//            self?.showAlert(title: "Error uploading photo", message: "\(error.localizedDescription)")
//          }
//        case .success(let url):
//          self?.updateItemImageURL(url, documentId: documentId)
//        }
//      }
//    }
    
   
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func locationSwitch(_ sender: UISwitch) {
    }
    
    
}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL else {
            fatalError("could not attain original image")
        }
        self.imageURL = imageURL
        selectedImage = image
        dismiss(animated: true)
    }
}
