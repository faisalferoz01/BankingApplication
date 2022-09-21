//
//  AccountsView.swift
//  BankingApplication
//
//  Created by Faisal Feroz on 21/09/2022.
//

import SwiftUI

struct AccountsView: View {
    
    @ObservedObject var viewModel: AccountModelView

    var body: some View {
        ScrollView {
            ZStack {
                Image("background")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                VStack(alignment: .trailing) {
                        HStack {
                        VStack(alignment: .leading) {
                            Text(viewModel.account?.accountLabel ?? "")
                                .font(.title)
                            Text(viewModel.account?.accountNumber ?? "")
                            HStack {
                                Text("$\(viewModel.account?.availableBalance ?? "")")
                                    .font(.title2)
                                Text("Available")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15, height: 30, alignment: .center)
                    }
                    .background(Color.black.opacity(0.10))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                }
            }
            Text("List...")
            .frame(maxWidth: .infinity, maxHeight: 180)
        }
    }
}
