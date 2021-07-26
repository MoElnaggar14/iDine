//
//  CheckoutView.swift
//  iDine
//
//  Created by Mohammed Elnaggar on 26/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    @State private var paymentType: String = "Cash"
    @State private var addLoyaltyDetails: Bool = false
    @State private var loyaltyNumber: String = ""
    @State private var tipAmount: Int = 15
    @State private var showingPaymentAlert: Bool = false
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                        Text("TOTAL: \(totalPrice)")
                        .font(.headline)) {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
            
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showingPaymentAlert, content: {
                Alert(title: Text("Order Confirmed"), message: Text("Your Total was \(totalPrice)"), dismissButton: .default(Text("OK")))
            })
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
