//
//  Product.swift
//  Paso
//
//  Created by Leonardo on 27/12/23.
//

import SwiftUI
import CloudKit

class Product: PrivateDB {
    var modifierGroupsIds: [String] {
        set { record[keys.modifierGroupsIds.rawValue] = newValue }
        get { record[keys.modifierGroupsIds.rawValue] ?? [] }
    }
    
    var modifierGroups: [ModifierGroup]
    
    enum keys: String {
        case type = "Products"
        case name = "Name"
        case color = "Color"
        case modifierGroupsIds = "ModifierGroupsIds"
    }
    
    init() {
        self.modifierGroups = []
        super.init(recordType: keys.type.rawValue)
    }
    
    override init(record: CKRecord) {
        self.modifierGroups = []
        super.init(record: record)
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.record.recordID.recordName == rhs.record.recordID.recordName &&
        lhs.name == rhs.name &&
        lhs.modifierGroupsIds == rhs.modifierGroupsIds
    }
}
