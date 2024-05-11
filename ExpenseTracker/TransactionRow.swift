//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Daniel Bauer on 11.05.24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20){
            RoundedRectangle(cornerRadius: 50, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .fill(Color.IconColor.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.icon)
                }
            VStack(alignment: .leading, spacing: 6){
                
                // Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Transaction Amount
            Text(transaction.signedAmount, format: .currency(code: "EUR"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.textColor : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider{
    static var previews: some View{
        TransactionRow(transaction: transactionPreviewData)
    }
}
