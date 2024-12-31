//
//  AddView.swift
//  VeresiyeApp
//
//  Created by Kerem on 9.11.2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State var nameTextField: String = ""
    @State var showAlert: Bool = false
    @State var viewModel: CompanyViewModel
    
    
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Company Name")
                    .padding(.leading)
                
                TextField("Enter Company Name", text: $nameTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(15)
                    .padding(.horizontal)
            }
            
            Button("Save") {
                if nameTextField.isEmpty {
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

        }
    }
    
    func saveButton() {
        viewModel.addCompany(name: nameTextField)
        dismiss()
    }
}

//#Preview {
//    AddView()
//        .environmentObject(CompanyViewModel())
//}
