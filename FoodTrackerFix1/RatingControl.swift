//
//  RatingControl.swift
//  FoodTrackerFix1
//
//  Created by Trung on 9/12/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
       super.init(coder: coder)
        setupButtons()
    }
    
    
////////////////////////////////
    
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)

        
        for index in 0..<starCount {
            
            let button = UIButton()
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
//            button.backgroundColor = UIColor.red
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            
            button.accessibilityLabel = "set \(index + 1) star rating"
            
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            addArrangedSubview(button) // cho button vao trong cai stackview moi keo vao
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
   
    
/////////////    ///////////////////////////
    
    
    @objc func ratingButtonTapped(button: UIButton) {
//        print("Button presen")
        
        guard let index = ratingButtons.index(of: button) else {
            fatalError("the button, \(button), í not in the ratingButtons array: \(ratingButtons)")
        }
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        }
        else {
            rating = selectedRating
        }
        
        
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
            
            let hintString: String?
            if rating == index + 1 {
                hintString = "Nhan de xep hang lai bang 0"
            }
            else {
                hintString = nil
            }
            
            let valueString: String
            switch (rating) {
            case 0: valueString = " no rating set"
            case 1: valueString = "1 star set"
            default:
                valueString = "\(rating) stars set"
            }
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }


}
