//
//  SummaryView.swift
//  BankingApplication
//
//  Created by Faisal Feroz on 21/09/2022.
//

import SwiftUI

struct SummaryView: View {
    
    @ObservedObject var viewModel: AccountModelView
    @Binding var tab: ViewData
    
    var body: some View {
        VStack {
            ForEach(viewModel.accountslist, id: \.self) { account in
                Accounts(account: account)
                    .onTapGesture {
                        viewModel.account = account
                        self.tab = .details
                    }
            }
            Spacer()
        }
        
    }
}

