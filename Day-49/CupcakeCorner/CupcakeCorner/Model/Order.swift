//
//  Order.swift
//  CupcakeCorner
//
//  Created by Laxman Singh Koranga on 04/03/2024.
//

import Foundation

@Observable
class Order {
    // types of cakes in a static array for all possible options.
    static let types = ["ButterScotch","Chocolate","Rainbow","Strawberry","Vanilla"]
    var type = 0
    // no.of cakes user wants to order.
    var quantity: Int = 1
    
    // special requests.
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
