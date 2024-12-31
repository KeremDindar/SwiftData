//
//  CompanyViewModel.swift
//  VeresiyeApp
//
//  Created by Kerem on 11.11.2024.
//

import Foundation
import SwiftData


class CompanyViewModel: ObservableObject {
    
    @Published var compnies: [Company] = []
    var modelContext: ModelContext
    
    init( modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Company>(sortBy: [SortDescriptor(\.name)])
            compnies = try modelContext.fetch(descriptor)
        }catch {
            print(error.localizedDescription)
        }
    }
    

    
    func addCompany(name: String) {
        let newCompany = Company( name: name)
        modelContext.insert(newCompany)
        saveContext()
    }
    

    
    func addDebt(company: Company,title: String, debt: String, credit: String, description: String) {
        if let index = compnies.firstIndex(where: {$0.id == company.id}) {
            let newDebt = Debts(title: title, debt: debt, credit: credit, descrip: description)
            compnies[index].debts.append(newDebt)
            saveContext()
        }
    }
    
    func updateDebt(company: Company, debtItem: Debts, newTitle: String, newDebt: String, newCredit: String, newDescription: String) {
        if let update = company.debts.first(where: { $0.id == debtItem.id }) {
            update.title = newTitle
            update.debt = newDebt
            update.credit = newCredit
            update.descrip = newDescription
            
            saveContext()
        }
    }
     func saveContext() {
           do {
               try modelContext.save()
               fetchData()
           } catch {
               print("Error: \(error.localizedDescription)")
           }
       }
    
   
}




