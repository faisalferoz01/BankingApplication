//
//  AccountModel.swift
//  BankingApplication
//
//  Created by Faisal Feroz on 21/09/2022.
//

import Foundation

class AccountModelView: ObservableObject {
    
    @Published var account: Account?
    @Published var accountslist: [Account] = []
   
    func getAccounts() {
        guard let url = URL(string: "http://www.mocky.io/v2/5abb1042350000580073a7ea")
        else { fatalError("URL not found") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ",error)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let bank = try JSONDecoder().decode(DataModel.self, from: data)
                        self.accountslist.append(contentsOf: bank.accounts)
                    } catch let error {
                        print("Decoding Error:",error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
