//
//  ProfileViewController.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/20/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileView: ProfileView = {
        let pv = ProfileView()
        pv.collectionView.delegate = self
        pv.collectionView.dataSource = self
        pv.delegate = self
        return pv
    }()
    
    private lazy var imagePickerController: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.delegate = self
        return ip
    }()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as? EventCell else {
            fatalError("Failed to queue EventCell")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width / 2, height: view.frame.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    
}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true , completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        profileView.imageView.image = image
        //TODO: Handle set image in firebase.
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: ProfileViewDelegate {
    func didPressButton() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
                   self?.showPicker(sourceType: .camera)
               }
               let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { [weak self] _ in
                   self?.showPicker(sourceType: .photoLibrary)
               }
               
               if UIImagePickerController.isSourceTypeAvailable(.camera) {
                   alertController.addAction(cameraAction)
               }
               
               alertController.addAction(libraryAction)
               alertController.addAction(cancelAction)
               present(alertController, animated: true)
    }
    
    private func showPicker(sourceType: UIImagePickerController.SourceType) {
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true)
    }
    
    
}
