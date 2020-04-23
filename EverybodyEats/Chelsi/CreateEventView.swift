//
//  CreateEventView.swift
//  EverybodyEats
//
//  Created by Chelsi Christmas on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class CreateEventView: UIView {

    public lazy var eventImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo.on.rectangle")
        return image
    }()
    
    public lazy var eventNameTextField: UITextField = {
    let textField = UITextField()
        textField.placeholder = "Enter event name"
        textField.backgroundColor = .white
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        return textField
    }()
    
    // TODO: implement a picker view for date
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupEventImage()
        setupEventNameTextField()
    }
    
    private func setupEventImage() {
        addSubview(eventImage)
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),  eventImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.40),
            eventImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.50),
            eventImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
            
        ])
    }
    
    private func setupEventNameTextField() {
        addSubview(eventNameTextField)
        eventNameTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                eventNameTextField.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 20),
                 eventNameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.60),
                 eventNameTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    

}
