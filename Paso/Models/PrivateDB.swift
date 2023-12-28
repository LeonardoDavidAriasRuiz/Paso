//
//  PrivateDB.swift
//  Paso
//
//  Created by Leonardo on 27/12/23.
//

import SwiftUI
import CloudKit

class PrivateDB: Hashable, Identifiable, Equatable, Comparable {
    let privateDB = CKContainer.default().privateCloudDatabase
    var record: CKRecord
    
    var id: CKRecord.ID {
        record.recordID
    }
    
    var name: String {
        set { record[itemsKeys.name.rawValue] = newValue }
        get { record[itemsKeys.name.rawValue] ?? "" }
    }
    
    var color: UIColor {
        set { record[itemsKeys.color.rawValue] = newValue.toRGBAString() }
        get { UIColor.fromRGBAString(record[itemsKeys.color.rawValue] ?? "") ?? UIColor(Color(.blue)) }
    }
    
    enum itemsKeys: String {
        case name = "Name"
        case color = "Color"
    }
    
    init(recordType: String) {
        self.record = CKRecord(recordType: recordType)
    }
    
    init(record: CKRecord) {
        self.record = record
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PrivateDB, rhs: PrivateDB) -> Bool {
        lhs.id == rhs.id
    }
    
    static func < (lhs: PrivateDB, rhs: PrivateDB) -> Bool {
        lhs.name < rhs.name
    }
    
    private func save() async -> Bool {
        do {
            try await privateDB.save(self.record)
            return true
        } catch {
            return false
        }
    }

    private func delete() async -> Bool {
        do {
            try await privateDB.deleteRecord(withID: self.record.recordID)
            return true
        } catch {
            return false
        }
    }
}
