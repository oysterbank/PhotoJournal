//
//  Entry.swift
//  PhotoJournal
//
//  Created by Kris Laratta on 8/12/18.
//  Copyright © 2018 Kris Laratta. All rights reserved.
//

import UIKit

class Entry {
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var favorite: Bool
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, favorite:Bool) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.favorite = favorite
    }
}
