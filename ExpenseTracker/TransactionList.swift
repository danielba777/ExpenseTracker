//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Daniel Bauer on 12.05.24.
//

import SwiftUI

struct TransactionList: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
                // Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id:\.key){ month,
                    transactions in
                    Section{
                        // Transaction List
                        ForEach(transactions){ transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        // Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
        }
        .navigationTitle("Transaktionen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider{
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View{
        NavigationView{
            TransactionList()
        }
        .environmentObject(transactionListVM)
    }
}
