//
//  User input.swift
//  User input
//
//  Created by Thomas Kapocsi on 2021-08-11.
//

import SwiftUI

struct User_input: View {
    
    @Binding var entered_text:String
    
    var body: some View {
                TextField("PLU", text:$entered_text)
                    .font(.body)
                    .keyboardType(.numberPad)
                    .frame(width: 390, height: 70,alignment: .center)
                    .padding(10)
        
    }}
                    
            

