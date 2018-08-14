//
//  PhotoJournalTests.swift
//  PhotoJournalTests
//
//  Created by Kris Laratta on 8/6/18.
//  Copyright © 2018 Kris Laratta. All rights reserved.
//

import XCTest
@testable import PhotoJournal

class PhotoJournalTests: XCTestCase {
    
    //MARK: Entry Class Tests
    
    // Confirm that the entry initializer returns an Entry object when passed valid parameters
    func testEntryInitializationFails() {
        // Empty name string
        let emptyStringEntry = Entry.init(name: "", photo: nil, favorite: false)
        XCTAssertNil(emptyStringEntry)
    }
    
}
