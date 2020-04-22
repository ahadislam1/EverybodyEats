//
//  Date+Extention.swift
//  EverybodyEats
//
//  Created by Jaheed Haynes on 4/22/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import Foundation

extension Date{
    public func dateString(_ format: String = "MM-dd-yyyy HH:mm") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        // self is the date
        return dateFormatter.string(from: self)
    }
}
