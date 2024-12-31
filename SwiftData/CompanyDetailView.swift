//
//  CompanyDetailView.swift
//  VeresiyeApp
//
//  Created by Kerem on 11.11.2024.
//

import SwiftUI

struct CompanyDetailView: View {
    @EnvironmentObject var viewModel: CompanyViewModel
    @State private var isEditing = false
    @State private var title = ""
    @State private var debt = ""
    @State private var credit = ""
    @State private var description = ""
    let debts: Debts
    let company: Company
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Company Details")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    DetailRowView(title: " Title:", text: $title, isEditing: isEditing)
                    DetailRowView(title: "Debt Price:", text: $debt, isEditing: isEditing)
                    DetailRowView(title: "Credit Price:", text: $credit, isEditing: isEditing)
                    DetailRowView(title: "Description:", text: $description, isEditing: isEditing, isMultiline: true)
                }
                .padding()
                
                Spacer()
                
                if isEditing {
                    Button("Save") {
                        saveChanges()
                    }
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isEditing ? "Cancel" : "Edit") {
                        isEditing.toggle()
                    }
                }
            }
            .onAppear {
                title = debts.title
                debt = debts.debt
                credit = debts.credit
                description = debts.descrip
            }
        }
    }
    
     func saveChanges() {
//         let updateDebt = Debts(/*id: debts.id*/title: title, debt: debt, credit: credit, descrip: description)
        viewModel.updateDebt(company: company, debtItem: debts, newTitle: title, newDebt: debt, newCredit: credit, newDescription: description)
        isEditing = false
    }
}

//#Preview {
//    CompanyDetailView(debts: Debts(title: "asf", debt: "123", credit: "1231", descrip:  "sdvsdg"), company: Company( name: "asd"))
//        .environmentObject(CompanyViewModel())
//}
