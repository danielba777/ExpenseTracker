//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Daniel Bauer on 11.05.24.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardings", account: "Visa Desjardings", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
