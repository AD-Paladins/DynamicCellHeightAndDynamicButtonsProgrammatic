//
//  Book.swift
//  DynamicCellHeightProgrammatic
//
//  Created by Satinder Singh on 7/3/16.
//  Copyright © 2016 Satinder. All rights reserved.
//

import UIKit
struct ButtonAtributes {
    let title: String
    let message: String
}

class Book: NSObject {
    let type: String
    let name: String
    let details: String
    let buttonsAttibutes: [ButtonAtributes]
    
    init(type: String, name: String, details: String, buttonsAttibutes: [ButtonAtributes] ) {
        self.name = name
        self.details = details
        self.type = type
        self.buttonsAttibutes = buttonsAttibutes
    }
    
}
