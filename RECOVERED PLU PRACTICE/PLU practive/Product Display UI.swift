//
//  Product Display UI.swift
//  Product Display UI
//
//  Created by Thomas Kapocsi on 2021-08-11.
//

import SwiftUI

struct Product_Display: View { // Display Image of product with plu and sold by below
    
    var current_item:Int
    @Binding var blur_plu:Bool
    
    var body: some View {
       
        VStack{
            
            Image(list_products[current_item].productreference)
                .resizable(resizingMode: .stretch)
                .frame(height: 300.0)
                .clipShape(Circle())
                .aspectRatio(0.2, contentMode: .fill)
                .accessibilityIdentifier("Picture of Product")
            
        
            HStack {
                Text(list_products[current_item].productreference + ", " + String(list_products[current_item].SoldBY))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
            }
             
            HStack {
                if blur_plu == true {
                    Text("PLU : ")
                        .font(.title2)
                    Text(String(list_products[current_item].productPLU))
                        .font(.title2)
                }
                else {
                    Text("PLU : ")
                        .font(.title2)
                    Text(String(list_products[current_item].productPLU))
                        .font(.title2)
                        .blur(radius: 5)
                    
                }
             
                
            }//Close HStack
            
                
                
        }//Close main Stack
        .frame(width: 380, height: 383, alignment: .center)
    }//Close Body
}//Close Product Display
