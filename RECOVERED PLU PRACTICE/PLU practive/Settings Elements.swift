//
//  Settings Elements.swift
//  Settings Elements
//
//  Created by Thomas Kapocsi on 2021-08-11.
//

import SwiftUI

struct SettingsMenu: View {
    
    @Binding var always_show_plu:Bool
    @State var showQuizMode:Bool = false
    @Binding var requireAnwerContinue:Bool
    
    var body: some View{
        
        Text("Settings")
            .font(.largeTitle)

        setting_item(setting_state:$always_show_plu, toggle_tile: "Always Show PLU")
        setting_item(setting_state: $requireAnwerContinue, toggle_tile: "Require Anwer to continue")
    }
        
        
}

struct setting_item : View {
    
    @Binding var setting_state:Bool
    var toggle_tile:String
    var body: some View {
        Toggle(toggle_tile, isOn: $setting_state)
            .frame(width: 200.0)
            

    }
}


struct menu_item : View {
    

    @State var menu_name:String = "place holder"
    @Binding var menu_button_state:Bool
    @State var shuffleProducts:Bool
    
    var body: some View{
            Text(menu_name)
            .frame(minWidth:150,minHeight: 50)
            .font(.title)
            .foregroundColor(Color("MenuBar Text"))
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("MenuBar")/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                
                if shuffleProducts{
                    print("shuffling")
                    list_products = list_products.shuffled()
                }
                HapticsManager.shared.selectionVibrate()
                print("opening menu")
                menu_button_state.toggle()
            }
            .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
            
        }
    
    }

