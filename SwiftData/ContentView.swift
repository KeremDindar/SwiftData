//
//  ContentView.swift
//  VeresiyeApp
//
//  Created by Kerem on 9.11.2024.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @StateObject  private var viewModel: CompanyViewModel
    
    init(modelContext: ModelContext) {
        _viewModel = StateObject(wrappedValue: CompanyViewModel(modelContext: modelContext))
    }
    
    //@State  private var viewModel: CompanyViewModel
    //
    //  init(modelContext: ModelContext) {
    //      let viewModel = CompanyViewModel(modelContext: modelContext)
    //      _viewModel = State.init(initialValue: viewModel)
    //  }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Total Debt: \(calculatedTotalCompanies(), specifier: "%.0f")$")
                            .font(.title2)
                        Spacer()
                    }
                    .padding()
                    
                    
                    ForEach(viewModel.compnies) { company in
                        NavigationLink(destination: CompanyDetailListView( company: company,debts: Debts(title: "", debt: "", credit: "", descrip: ""))
                            .environmentObject(viewModel)) {
                                HStack {
                                    Text(" \(company.name)")
                                        .font(.title2)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    
                                    Text("\(calculatedTotalDebt(company:company), specifier: "%.0f")$")
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
                .navigationTitle("Companies")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    trailing:
                        NavigationLink("Add", destination: AddView(viewModel: viewModel))
                )
            }
        }
        
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
    func calculatedTotalCompanies() -> Double {
        return viewModel.compnies.reduce(0.0) { total, company in
            total + calculatedTotalDebt(company: company)
        }
    }
    
}

//#Preview {
//    ContentView()
//        .environmentObject(CompanyViewModel())
//}





