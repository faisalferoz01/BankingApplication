//
//  Accounts.swift
//  BankingApplication
//
//  Created by Faisal Feroz on 21/09/2022.
//

import SwiftUI

struct Accounts: View {
    
    var account: Account

    var body: some View {
        ZStack(alignment: .bottom) {
            Image("background")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 180)
            HStack {
                VStack(alignment: .leading) {
                    Text(account.accountLabel)
                    Text(account.accountNumber)
                    HStack {
                        Text("$" + account.availableBalance)
                        Text("Available")
                    }
                    HStack {
                        Text("$" + account.currentBalance)
                            .font(.title2)
                        Text("Current")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 18, height: 42, alignment: .center)
            }
            .padding(.horizontal)
            .padding()
            .foregroundColor(.white)
            .background(Color.black.opacity(0.10))
        }
       
    }
}
