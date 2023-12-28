//
//  Category.swift
//  Paso
//
//  Created by Leonardo on 27/12/23.
//

import SwiftUI
import CloudKit

class Category: PrivateDB {
    var productsIds: [String] {
        set { record[keys.productsIds.rawValue] = newValue }
        get { record[keys.productsIds.rawValue] ?? [] }
    }
    
    var products: [Product]
    
    enum keys: String {
        case type = "Categories"
        case name = "Name"
        case color = "Color"
        case productsIds = "ProductsIds"
    }
    
    init() {
        self.products = []
        super.init(recordType: keys.type.rawValue)
    }
    
    override init(record: CKRecord) {
        self.products = []
        super.init(record: record)
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.record.recordID.recordName == rhs.record.recordID.recordName &&
        lhs.name == rhs.name &&
        lhs.productsIds == rhs.productsIds
    }
}

