//
//  NCreateNoteView.swift
//  Notes
//
//  Created by Gonzalo on 21/12/24.
//

import SwiftUI

struct NCreateNoteView: View {
    
    @StateObject var viewModel : NCreateNoteViewModel = NCreateNoteViewModel()

    var onNoteCreated: ((NCard) -> Void)?


    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                
                Spacer(minLength: 50)
                
                TextFieldView()
            
                TextEditorView()
                
                HStack {
                    Text("Size")
                    Spacer()
                    CustomPickerView()
                }.padding()
                                    
                
                Toggle("Favorite", isOn: $viewModel.isFavorite)
                    .onChange(of: viewModel.isFavorite){ newValue in
                        viewModel.isFavorite = newValue
                    }.padding()
                
                Spacer()
                
                SendDataView().padding(.top,20)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .padding()
        .background(Color.cyan.opacity(0.2))
  
    }
    
    func onTap(){
            
        let card = viewModel.createNote()
        onNoteCreated?(card)
        
        print("Note: \(card)")
    }
        
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(alignment: .center) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
        
            
            Text("Crear nueva nota")
                .font(.largeTitle)
                .bold()
                .padding(.bottom,10)
        }
    }
    
    @ViewBuilder
    func TextFieldView() -> some View {
        TextField("Título", text: $viewModel.title)
            .font(.headline)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
    }
    
    
    @ViewBuilder
    func TextEditorView() -> some View {
        TextEditor(text: $viewModel.description)
            .font(.body)
            .frame(height: 150)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .scrollContentBackground(.hidden)
    }
    
    @ViewBuilder
    func CustomPickerView() -> some View {
        Picker("Size", selection: $viewModel.size){
            Text("Small").tag(NCardType.small)
            Text("Medium").tag(NCardType.medium)
               }
        .pickerStyle(.menu)
    }
    
    @ViewBuilder
    func SendDataView() -> some View {
        
        Button(action: {
            onTap()
            viewModel.showAlert = true
        }) {
            HStack(
                alignment: .center, spacing: 10
            ) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.yellow)
                Text("Save note")
                    .fontWeight(.bold)
                    
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .alert("Create successful", isPresented: $viewModel.showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("Save note")
                }
    }
}

#Preview {
    NCreateNoteView()
}
