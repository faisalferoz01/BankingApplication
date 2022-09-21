//
//  ContentView.swift
//  BankingApplication
//
//  Created by Faisal Feroz on 21/09/2022.
//

import SwiftUI



struct ContentView: View {
    
   
    @StateObject var viewModel = AccountModelView()
    @State var viewData: ViewData = .firstview
    
    
    var body: some View {
        NavigationView {
            TabView(selection: $viewData) {
                SummaryView(viewModel: viewModel, tab: $viewData)
                    .tabItem {
                        Label("Summary", systemImage: "list.triangle")
                    }.tag(ViewData.firstview)
                AccountsView(viewModel: viewModel)
                    .tabItem {
                        Label("Accounts", systemImage: "waveform.path.ecg.rectangle")
                    }.tag(ViewData.details)
                PaymentsView()
                    .tabItem {
                        Label("Payments", systemImage: "dollarsign.square.fill")
                    }.tag(ViewData.history)
            }
            .navigationTitle(viewData == .firstview ? "Summary" : viewData == .details ? "Accounts" : "Payments")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {}, label: {
                Image(systemName: "line.3.horizontal")
                Text("Home")
            }),
            trailing: Button(action: {}, label: { Image(systemName: "lock") })
            )
        }
        .onAppear {
            viewModel.getAccounts()
        }
    }
}


enum ViewData: String {
    case firstview
    case details
    case history
}
