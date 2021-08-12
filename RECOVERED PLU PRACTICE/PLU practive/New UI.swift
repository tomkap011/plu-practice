//
//  New UI.swift
//  New UI
//
//  Created by Thomas Kapocsi on 2021-08-11.
//

import SwiftUI




struct learn_mode : View {
    
    @State public var entered_PLU: String = ""
    @State public var entered_current_item:String = "0"
    @State public var current_item:Int = 0
    @Binding public var blur_plu:Bool
    @Binding public var requireAnwerContinue:Bool
    @State public var incorrect_anwser:Bool = false
    var body : some View {
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(Color("Backround"))
                .ignoresSafeArea()
            
        VStack(alignment: .leading){
            Product_Display(current_item: current_item, blur_plu: $blur_plu)
                .onTapGesture {
                    let max_current_item = list_products.endIndex - 1
                    let future_item = current_item + 1
                    
                    if requireAnwerContinue {
                        if Int(entered_PLU) == list_products[current_item].productPLU { //check for correct answer
                            if future_item > max_current_item{current_item = 0}
                            else{
                                entered_PLU = ""
                                print("correct anwser")
                                HapticsManager.shared.notificationVibrate(for: .success)
                                current_item = future_item
                                
                            }}
                        else{
                            HapticsManager.shared.impactVibrate()
                            print("incorrect anwser")
                        }
                        
                    }
                    else {
                    
                    if future_item > max_current_item{
                        current_item = 0
                        }
                        else{
                            current_item = future_item
                        }
                    }}
                    
            User_input(entered_text: $entered_PLU)
               
    
        }
        }
        
    
}
}
struct quiz_mode : View {

    @State public var entered_PLU: String = "992"
    @State public var entered_current_item:String = "0"
    @State public var current_item:Int = 8
    @State public var show_plu:Bool = true
    @State var show_score:Bool = false
    @Binding var showQuiz:Bool
    @State var  quizScore = 0
    let quizOutOf = 10
    @State var quizScorePrecentage = 0
    var body : some View {
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(Color("Backround"))
                .ignoresSafeArea()
            
        VStack(alignment: .leading){
            Product_Display(current_item: current_item, blur_plu: $show_plu)
                .onTapGesture {
                    let max_current_item = quizOutOf
                    let future_item = current_item + 1
                    quizScorePrecentage = quizScore/quizOutOf
                    quizScorePrecentage = quizScorePrecentage * 100
                    
                    
                    print(quizScore)
                    print(quizOutOf)

                    
                    //print("current "  + String(current_item + 1 ) + "\n max item" + String(max_current_item))
                    
                        if future_item  == max_current_item{
                            show_score.toggle()
                        }
                    
                        print(entered_PLU)
                        print(list_products[current_item].productPLU)
                        if Int(entered_PLU) == list_products[current_item].productPLU { //check for correct answer
                                entered_PLU = ""
                                print("correct anwser")
                                quizScore = quizScore + 1
                                HapticsManager.shared.selectionVibrate()
                            if future_item < max_current_item{ current_item = future_item}}
                        else{
                            HapticsManager.shared.selectionVibrate()
                            print("incorrect anwser")
                            if future_item < max_current_item{ current_item = future_item}}
                        }
                .sheet(isPresented: $show_score, onDismiss: {showQuiz = false},
                       content: {
                    
                        VStack{
                            Text("Quiz Results")
                                .font(.largeTitle)
                            Text(String(quizScore / quizOutOf))
                            

                           
                    }
                }
                )
                    
                    
                  

            User_input(entered_text: $entered_PLU)
               
    
        }
        }
    
}
}
struct Main_menu : View {
    
    static let shared = Main_menu()
    
    @State public var showquizMode:Bool = false
    @State var showpracticeMode:Bool = false
    @State var showsettings:Bool = false
    @State var always_show_plu:Bool = false
    @State var requireAnwerContinue:Bool = true
    
    

    var body: some View {
   ZStack {
            Rectangle()
                .foregroundColor(Color("Backround"))
                .ignoresSafeArea()
            VStack(spacing: 30){
                Text("PLU Practice")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    
                Spacer(minLength: 20)
                    .frame(height: 30)
                menu_item(menu_name: "Quiz", menu_button_state: $showquizMode, shuffleProducts: true)
                menu_item(menu_name: "Practice", menu_button_state: $showpracticeMode, shuffleProducts: true)
                menu_item(menu_name: "Settings", menu_button_state: $showsettings, shuffleProducts: false)
                
        }
        .popover(isPresented: $showpracticeMode) {
            learn_mode(blur_plu: $always_show_plu, requireAnwerContinue: $requireAnwerContinue)}
        .popover(isPresented: $showquizMode) {
            quiz_mode(showQuiz: $showquizMode)}
}
        .popover(isPresented: $showsettings) {
            SettingsMenu(always_show_plu: $always_show_plu, requireAnwerContinue: $requireAnwerContinue)
        }
    }
}

struct New_UI_Previews: PreviewProvider {
    static var previews: some View {
        Main_menu()
            .preferredColorScheme(.dark)
            
    }
}


