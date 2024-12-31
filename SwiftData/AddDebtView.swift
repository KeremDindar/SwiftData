//
//  AddDebtView.swift
//  VeresiyeApp
//
//  Created by Kerem on 15.11.2024.
//

import SwiftUI

struct AddDebtView: View {
    @Environment(\.dismiss) var dismiss
    @State var titleTextField: String = ""
    @State var debtTextField: String = ""
    @State var creditTextField: String = ""
    @State var descripTextField: String = ""
    @State var showAlert: Bool = false
    @State var viewModel: CompanyViewModel
    
     var  compamy: Company
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {

                
                Text("Title")
                    .padding(.leading)
                
                TextField("Enter Title", text: $titleTextField)
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(15)
                    .padding(.horizontal)

                
                
                Text("Debt Price")
                    .padding(.leading)
                
                TextField("Enter Debt", text: $debtTextField)
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(15)
                    .padding(.horizontal)

                Text("Credit Price")
                    .padding(.leading)

                TextField("Enter Credit", text: $creditTextField)
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(15)
                    .padding(.horizontal)
                
                Text("Description ")
                    .padding(.leading)

                TextField("Enter Descriptipn", text: $descripTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(15)
                    .padding(.horizontal)
                


            }
            if titleTextField.isEmpty || debtTextField.isEmpty || creditTextField.isEmpty || descripTextField.isEmpty {
                
            }
            
            Button("Save") {
                if titleTextField.isEmpty || debtTextField.isEmpty || creditTextField.isEmpty || descripTextField.isEmpty {
                    showAlert = true
                }else {
                    saveButton()
                    
                }
            }
            
            .padding()
            .frame(width: 200)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            .alert(isPresented: $showAlert) {
                            Alert(title: Text("Error"), message: Text("Bilgileri kontrol et"), dismissButton: .default(Text("OK")))
                        }
            .padding()

        }
        .navigationTitle(compamy.name)
        
    }
    
    func saveButton() {
        viewModel.addDebt(company: compamy, title: titleTextField, debt: debtTextField, credit: creditTextField, description: descripTextField)
        dismiss()
    }
}


//#Preview {
//    NavigationStack {
//        AddDebtView( compamy: .exampleCompany)
//    }
//}
