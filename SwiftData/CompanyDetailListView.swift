//
//  CompanyDetailListView.swift
//  VeresiyeApp
//
//  Created by Kerem on 13.11.2024.
//

import SwiftUI

struct CompanyDetailListView: View {
    
    @EnvironmentObject var viewModel: CompanyViewModel
    let company: Company
    let debts: Debts
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Company Details")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    VStack(alignment: .leading) {
                        
                        Text("\(company.name) total debt: \(calculatedTotalDebt(company: company), specifier: "%.0f")$")
                            .font(.system(size: 23))
                            .padding()
                        Rectangle()
                            .frame(height: 1)
                    }
                    .padding(.bottom)
                    VStack {
                        ForEach(company.debts) { debt in
                            
                            NavigationLink(destination: CompanyDetailView(debts: debt,  company: company)
                                .environmentObject(viewModel)) {
                                HStack {
                                    Text(debt.title)
                                        .font(.title2)
                                        .foregroundStyle(.black)
                                    Spacer()
                                    
                                    Text("\(calculatedDebtDiff(debt:debt ), specifier: "%.0f")$")
                                        .font(.title3)
                                        .foregroundStyle(.black)
                                }
                                .padding(.horizontal)
                                .padding(.vertical)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                        }
                    }
                }
            }
            .navigationBarItems(
                trailing:
                    NavigationLink("Add", destination: AddDebtView( viewModel: viewModel, compamy: company))
                    .environmentObject(viewModel)
            )
         
            
        }
        
    }
    func calculatedDebtDiff(debt: Debts) -> Double {
           let debtAmount = Double(debt.debt) ?? 0.0
           let creditAmount = Double(debt.credit) ?? 0.0
           return creditAmount - debtAmount
        }
    
    func calculatedTotalDebt(company: Company) -> Double {
        let totalDebt = company.debts.reduce(0.0) { total, debt in
            total + (Double(debt.debt) ?? 0)
        }
        
        let totalCredit = company.debts.reduce(0.0) { total, debt in
            total + (Double(debt.credit) ?? 0)
        }
        
        return totalCredit - totalDebt
    }

}

//#Preview {
//    CompanyDetailListView( company:.exampleCompany, debts: Debts(title: "", debt: "", credit: "", description: ""))
//        .environmentObject(CompanyViewModel())
//}
