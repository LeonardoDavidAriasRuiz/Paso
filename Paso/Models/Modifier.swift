//
//  Modifier.swift
//  Paso
//
//  Created by Leonardo on 27/12/23.
//

import SwiftUI
import CloudKit

class Modifier: PrivateDB {
    enum keys: String {
        case type = "Modifiers"
        case name = "Name"
        case color = "Color"
    }
    
    init() {
        super.init(recordType: keys.type.rawValue)
    }
    
    override init(record: CKRecord) {
        super.init(record: record)
    }
    
    static func == (lhs: Modifier, rhs: Modifier) -> Bool {
        lhs.record.recordID.recordName == rhs.record.recordID.recordName &&
        lhs.name == rhs.name &&
        lhs.color == rhs.color
    }
}

