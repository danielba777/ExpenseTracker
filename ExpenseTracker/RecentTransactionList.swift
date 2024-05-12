//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Daniel Bauer on 11.05.24.
//

import SwiftUI

struct RecentTransactionList: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Letzte Transaktionen")
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    TransactionList()
                    
                } label: {
                    HStack(spacing: 4){
                        Text("Alle anzeigen")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            // Transaction list
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element){ index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider{
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View{
        RecentTransactionList()
            .environmentObject(transactionListVM)
    }
}
