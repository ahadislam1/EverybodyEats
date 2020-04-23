//
//  EventCell.swift
//  MockUp-Everybody-Eats
//
//  Created by Chelsi Christmas on 4/21/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class EventCell: UICollectionViewCell {
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var allergenLabel: UILabel!
    
    private var event: Event!
    
    public func configureCell(for post: Event) {
     
    }
    
    private func updateUI (imageURL: String, allergen: String, eventDate: String, eventTitle: String, eventLocation: String, eventTime: String){
        
        eventImageView.kf.indicatorType = .activity
        eventImageView.kf.setImage(with: URL(string: imageURL))
        eventTitleLabel.text = eventTitle
        dateLabel.text = eventDate
        allergenLabel.text = allergen
        locationLabel.text = eventLocation
        timeLabel.text = eventTime
    }
    
}
