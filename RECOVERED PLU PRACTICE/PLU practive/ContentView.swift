//
//  ContentView.swift
//  PLU practive
//
//  Created by Thomas Kapocsi on 2021-08-09.
//


import SwiftUI
import Foundation


struct ContentView: View {
   //Defing variables

   let total_items = list_products.endIndex
    //DEPRACATED defining variables
   
    var body: some View {
      ZStack{ //Start Bac kround
         if Int(entered_PLU) == list_products[current_item].productPLU{
           Image("Green Backround")
               .resizable()
            .scaleEffect(1.2)}
            else{
               Image("Red Backround")
                  .resizable()
                  .scaleEffect(1.2)
                  
            }
         VStack(alignment: .center) {
            VStack() { // Info Display Stack
               //Displays the product
               Image(list_products[current_item].productRefrence)
                  .resizable()
                  .frame(height: 300.0)
                  .fixedSize(horizontal: false, vertical: true)
                  .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
               
               
               Text(list_products[current_item].productRefrence)
                  .font(.largeTitle)
                  .fontWeight(.medium)
                  .multilineTextAlignment(.center)
                  .frame(height: nil)
               
               Text(list_products[current_item].SoldBY)
                  .font(.title3)
               
               //Displays the PLU if needed
               HStack {
                  Text("PLU : ")
                     .font(.title2)
                  
                  if blur_switch_state == true {
                     Text("\(list_products[current_item].productPLU)")
                        .lineLimit(0)
                        .blur(radius: 10)
                     .font(.title2)}
                  else {
                     Text("\(list_products[current_item].productPLU)")
                     .font(.title2)}}
               
               
               VStack(alignment: .center){
                  if Int(entered_PLU) == list_products[current_item].productPLU {
                     Button("Next") {
                        print(list_products.endIndex)
                        entered_PLU = ""
                        let current_item_new_value = current_item - 1
                        if current_item_new_value > -1 {
                           
                           if current_item_new_value < total_items{
                              current_item = current_item_new_value}
                           else {
                           }
                           
                        }
                        if current_item == 0{
                           current_item = total_items - 1
                        }
                        
                     }
                     .padding(10.0)//End Button code1
                     
                     
                  }//end button if
                  else {
                     Button("Nxt") {
                        entered_PLU = ""
                        let current_item_new_value = current_item - 1
                        if current_item_new_value > -1 {
                           if current_item_new_value < total_items {
                              current_item = current_item_new_value }}
                     }
                     .padding(10)
                     .border(Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2)
                     
                  }
                  
                  
                  
                  
                  
                  //Spacer().frame(height: 50)
                  
                  Button("Start From Top") {
                     current_item = total_items - 1
                  }
                  
                  Toggle(
                     isOn: $blur_switch_state,
                     label: {
                        Text("Blur PLU")
                     })
                  
                  
                  TextField("Enter PLU", text: $entered_PLU)
                     .keyboardType(.numberPad)
                     .padding(10)
               }
               
            }
                                                

         }// Close display Stack
      }//Close Backround
    }//Close Body
}//Close Struture
                    
            
  

//struct ContentView_Previews: PreviewProvider {
  //  static var previews: some View {
    //    ContentView()
        
   // }
//}

