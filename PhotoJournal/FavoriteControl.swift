//
//  FavoriteControl.swift
//  PhotoJournal
//
//  Created by Kris Laratta on 8/6/18.
//  Copyright © 2018 Kris Laratta. All rights reserved.
//

import UIKit

@IBDesignable class FavoriteControl: UIStackView {
    
    //MARK: Properties
    private var favoriteButton = UIButton()
    var favorite = false {
        didSet {
            updateButtonSelectionState()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButton()
        }
    }

    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    //MARK: Button Action
    @objc func favoriteButtonTapped(button: UIButton) {
        let isFavorite = favorite
        
        // Toggle button favorite state
        if isFavorite {
            favorite = false
        } else {
            favorite = true
        }
    }
    
    //MARK: Private Methods
    private func setupButton() {
        // Clear existing button
        removeArrangedSubview(favoriteButton)
        favoriteButton.removeFromSuperview()
        favoriteButton = UIButton()
        
        // Load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // Create the button
        let button = UIButton()
        
        // Set the button images
        button.setImage(emptyStar, for: .normal)
        button.setImage(filledStar, for: .selected)
        button.setImage(highlightedStar, for: .highlighted)
        button.setImage(highlightedStar, for: [.highlighted, .selected])
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
        // Set the accessibility label
        button.accessibilityLabel = "Favorite entry"
        
        // Setup the button action
        button.addTarget(self, action: #selector(FavoriteControl.favoriteButtonTapped(button:)), for: .touchUpInside)
        
        // Add the button to the stack
        addArrangedSubview(button)
        
        // Set the new button as the favorite control button
        favoriteButton = button
        
        updateButtonSelectionState()
    }
    
    private func  updateButtonSelectionState() {
        // Update button state depending on favorite toggle
        if favorite {
            favoriteButton.isSelected = true
        } else {
            favoriteButton.isSelected = false
        }
        
        // Set the hint string for the favorite star
        let hintString: String
        if favorite {
            hintString = "Tap to remove entry from favorites."
        } else {
            hintString = "Tap to add entry to favorites."
        }
        
        // Calculate the value string
        let valueString: String
        switch favorite {
        case true:
            valueString = "Favorited."
        default:
            valueString = "Not Favorited."
        }
        
        //Assign the hint string and the value string
        favoriteButton.accessibilityHint = hintString
        favoriteButton.accessibilityValue = valueString
    }
}
