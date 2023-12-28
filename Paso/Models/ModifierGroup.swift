//
//  ModifierGroup.swift
//  Paso
//
//  Created by Leonardo on 27/12/23.
//

import SwiftUI
import CloudKit

class ModifierGroup: PrivateDB {
    var modifiersIds: [String] {
        set { record[keys.modifiersIds.rawValue] = newValue }
        get { record[keys.modifiersIds.rawValue] ?? [] }
    }
    
    var modifiers: [Modifier]
    
    enum keys: String {
        case type = "ModifierGroups"
        case name = "Name"
        case color = "Color"
        case modifiersIds = "ModifiersIds"
    }
    
    init() {
        self.modifiers = []
        super.init(recordType: keys.type.rawValue)
    }
    
    override init(record: CKRecord) {
        self.modifiers = []
        super.init(record: record)
    }
    
    static func == (lhs: ModifierGroup, rhs: ModifierGroup) -> Bool {
        lhs.record.recordID.recordName == rhs.record.recordID.recordName &&
        lhs.name == rhs.name &&
        lhs.color == rhs.color &&
        lhs.modifiersIds == rhs.modifiersIds
    }
}

