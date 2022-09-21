//
//  Model.swift
//  BankingApplication
//
//  Created by Faisal Feroz on 21/09/2022.
//

import Foundation

struct DataModel: Codable {
    let accounts: [Account]
}

struct Account: Codable, Hashable {
    let  accountNumber: String
    let  accountBsb: String
    let  accountLabel: String
    let  currentBalance: String
    let  availableBalance: String
    let  transactions: String
}


