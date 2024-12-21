//
//  AlertTest.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import SwiftUI

struct AlertTest: View {
    @State private var showAlert = false
    @State private var showSheet = false

    var body: some View {
    
        Button(action: {

            showAlert = true

        }) {
            HStack(
                alignment: .center, spacing: 10
            ) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.yellow)
                Text("Show Alert")
                    .fontWeight(.bold)
                    
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .alert("Alerta", isPresented: $showAlert) {
                    Button("Accept", role: .cancel) { }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Save note")
                }
        
        
        Button(action: {
            showSheet = true
        }) {
            HStack(
                alignment: .center, spacing: 10
            ) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.yellow)
                Text("Show Sheet")
                    .fontWeight(.bold)
                    
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .sheet(isPresented: $showSheet, content: {
            NCreateNoteView()
        })
    }
}

#Preview {
    AlertTest()
}
