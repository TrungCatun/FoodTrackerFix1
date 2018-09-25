//
//  Meal.swift
//  FoodTrackerFix1
//
//  Created by Trung on 9/13/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import UIKit
class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    init?(name: String, photo: UIImage?, rating: Int) {
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
