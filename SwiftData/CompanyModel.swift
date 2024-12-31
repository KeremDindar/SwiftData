//
//  CompanyModel.swift
//  VeresiyeApp
//
//  Created by Kerem on 9.11.2024.
//

import Foundation
import SwiftData


@Model
 class Company {
    @Attribute(.unique) let id = UUID()
    var name: String
    var debts: [Debts]
    
    init( name: String ) {
        self.name = name
        self.debts = []
    }
    
}
@Model
 class Debts {
    @Attribute(.unique) let id = UUID()
    var title: String
    var debt: String
    var credit : String
    var descrip: String
    
    init( title: String, debt: String, credit: String, descrip: String) {
        self.title = title
        self.debt = debt
        self.credit = credit
        self.descrip = descrip
    }
    
}




