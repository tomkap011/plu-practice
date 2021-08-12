//
//  Backend.swift
//  PLU practive
//
//  Created by Thomas Kapocsi on 2021-08-10.
//

import Foundation
import SwiftUI



class Product : NSObject{
    var productPLU: Int
    var productreference: String
    var SoldBY:String

    
    required init(plu: Int ,reference: String,by:String) {
        productPLU = plu
        productreference = reference
        SoldBY = by
    
    }
}

struct backend_logic : Codable {
    
}
var list_products = [Product(plu:138,reference:"Carrot, Bunch",by: "ea"),
                     Product(plu:997, reference: "Arugula, Wild",by:"ea"),
                     Product(plu:122, reference: "Bean, Green",by:"kg"),
                     Product(plu:153, reference: "Bean, Purple", by: "kg"),
                     Product(plu:123, reference: "Bean, Yellow",by: "kg"),
                     Product(plu:70121, reference: "Bean, Mixed (Green, Yellow, Purple)", by: "kg"),
                     Product(plu:805,reference: "Beet,Red Bunch",by:"ea"),
                     Product(plu:805,reference: "Beet, Red Bunch",by:"ea"),
                     Product(plu:806,reference: "Beet, Yellow Bunch",by:"ea"),
                     Product(plu:619,reference: "Chard, Kahedescope (Mixed Colors)",by:"ea"),
                     Product(plu:993,reference: "Chard, Rhubard (Red)",by:"ea"),
                     Product(plu:881,reference: "Cilantro, Bunch",by:"ea"),
                     Product(plu:648,reference: "Corn",by:"ea"),
                     Product(plu:70120,reference: "Fennel Bulb (with Stalks & Fronds)",by:"ea"),
                     Product(plu:9673,reference: "Garlic, Fresh with Stalk ALBERTA",by:"ea"),
                     Product(plu:9671,reference: "Garlic, Purple ALBERTA",by:"kg"),
                     Product(plu:9672,reference: "Garlic Scapes",by:"kg"),
                     Product(plu:9312,reference: "Herb, Dill Bunch",by:"ea"),
                     Product(plu:9313,reference: "Herb, Dill PICKLING Bunch",by:"ea"),
                     Product(plu:948,reference: "Kale, Black Dino",by:"ea"),
                     Product(plu:988,reference: "Kale, Green Bunch",by:"ea"),
                     Product(plu:989,reference: "Kale, Red Bunch",by:"ea"),
                     Product(plu:811,reference: "Kohlrabi, (Purple/White/Green)",by:"ea"),
                     Product(plu:169,reference: "Leeks",by:"kg"),
                     Product(plu:992,reference: "Lettuce, Artisan Baby Oak",by:"ea"),
                     Product(plu:992,reference: "Lettuce, Artisan Baby Red Romaine",by:"ea"),
                     Product(plu:70116,reference: "Lettuce, Artisan Baby Green Romaine",by:"ea"),
                     Product(plu:70105,reference: "Lettuce, Artisan Butter Green",by:"ea"),
                     Product(plu:70106,reference: "Lettuce, Artisan Edox",by:"ea"),
                     Product(plu:165,reference: "Lettuce, Escarole Friesse",by:"ea"),
                     Product(plu:70108,reference: "Lettuce, Eztron",by:"ea"),
                     Product(plu:70113,reference: "Lettuce, Hampton",by:"ea"),
                     Product(plu:70110,reference: "Lettuce, Oak Leaf Green",by:"ea"),
                     Product(plu:70111,reference: "Lettuce, Oak Leaf Red",by:"ea"),
                     Product(plu:70114,reference: "Lettuce, Red Lion",by:"ea"),
                     Product(plu:70112,reference: "Lettuce, Relay (Dark Red)",by:"ea"),
                     Product(plu:991,reference: "Lettuce, Romaine Green Tower",by:"ea"),
                     Product(plu:70115,reference: "Lettuce, Romaine Red",by:"ea"),
                     Product(plu:120,reference:"Banana",by:"kg")
]


//var list_products = [Product(plu:138,reference:"Carrot, Bunch",by: "ea"),Product(plu: 997, reference: "Arugula, Wild",by:"ea"),Product(plu: 122, reference: "Bean, Green",by:"kg"),Product(plu: 153, reference: "Bean, Purple", by: "kg"),Product(plu: 123, reference: "Bean, Yellow",by: "kg"),Product(plu: 70121, reference: "Bean, Mixed (Green, Yellow, Purple)", by: "kg"),Product(plu:805,reference: "Beet,Red Bunch",by:"ea")]

//Product(plu:<PLU>,reference: "<IMG path/Desription>")

final class HapticsManager {
    
    static let shared = HapticsManager()
    
    private init() {}
    
    public func selectionVibrate() {
        DispatchQueue.main.async {
            let feedback = UISelectionFeedbackGenerator()
            feedback.prepare()
            feedback.selectionChanged()
        }
        }
       
    public func impactVibrate() {
        DispatchQueue.main.async {
            let feedback = UIImpactFeedbackGenerator()
            feedback.prepare()
            feedback.impactOccurred()
        }
        }
       
    
    public func notificationVibrate(for type : UINotificationFeedbackGenerator.FeedbackType){
        DispatchQueue.main.async {
            let feedback = UINotificationFeedbackGenerator()
            feedback.prepare()
            feedback.notificationOccurred(.error)
    }
        }
      
}

