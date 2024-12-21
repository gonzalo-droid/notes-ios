//
//  TextFieldTest.swift
//  Notes
//
//  Created by Gonzalo on 20/12/24.
//

import SwiftUI

struct TextFieldTest: View {
    
    @State var name: String = ""
    @State var description: String = ""
    @State var colorTF: Color = Color.gray.opacity(0.2)
    @State var colorTE: Color = Color.gray.opacity(0.2)
    @State private var showAlert = false
    @State var date: Date = Date()
    @State var level: String = "Jr"
    @State var month: Double = 6
    @State var isHumant: Bool = false


    var body: some View {
        
        VStack {
            HeaderView()
            
            Spacer(minLength: 50)
            
            TextFieldView()
        
            DatePickerView()
        
            
            
            HStack{
                Text("Months: \(month.formatted(.number))")
                Slider(value: $month, in: 1...12, step: 1)
            }
            
            HStack {
                Toggle("Is humant?", isOn: $isHumant)
                    .onChange(of: isHumant){ newValue in
                        isHumant = newValue
                        print("isHumant \(newValue)")
                    }                        
                
                CustomPickerView()
            }
            
            
            TextEditorView()
            
            SendDataView()
        }.padding()
    }
    
    @ViewBuilder
    func DatePickerView() -> some View {
        DatePicker("Date of birthday", selection: $date, displayedComponents: [.date])
            .datePickerStyle(.compact)

    }
    
    @ViewBuilder
    func TextEditorView() -> some View {
        TextEditor(text: $description)
            .font(.headline)
            .padding()
            .background(colorTE)
            .cornerRadius(8)
            .scrollContentBackground(.hidden)
            .onChange(of: description){ newValue in
                if(newValue.count > 50){
                    colorTE = .red
                } else {
                    colorTE = Color.gray.opacity(0.2)
                }
            }
    }
    
    @ViewBuilder
    func CustomPickerView() -> some View {
        Picker("Level", selection: $level){
            HStack{
                Image(systemName: "circles.hexagongrid.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20,height: 20)
                Text("Jr")
            }.tag("Jr")
            
            HStack{
                Image(systemName: "tram.tunnel.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20,height: 20)
                Text("SSr")
            }.tag("SSr")
            
            HStack{
                Image(systemName: "rectangle.on.rectangle.angled.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20,height: 20)
                Text("Sr")
            }.tag("Sr")
               }
        .pickerStyle(.menu)
    }
    
    @ViewBuilder
    func TextFieldView() -> some View {
        TextField("Name", text: $name)
            .font(.headline)
            .padding()
            .background(colorTF)
            .cornerRadius(8)
            .onChange(of: name) { newValue in
                if(newValue.count > 10){
                    colorTF = .red
                } else {
                    colorTF = Color.gray.opacity(0.2)
                }
            }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(alignment: .center) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
        
            
            Text("It's time to workout, now 🚀")
                .font(.system(size: 30))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .bold()
        }
    }

    @ViewBuilder
    func SendDataView() -> some View {
        Button(action: {
            showAlert = true

        }) {
            HStack(
                alignment: .center, spacing: 10
            ) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.yellow)
                Text("Appointment")
                    .fontWeight(.bold)
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
        }
        .alert("Alerta", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("Go to gym")
                }
    }
}

#Preview {
    TextFieldTest()
}
