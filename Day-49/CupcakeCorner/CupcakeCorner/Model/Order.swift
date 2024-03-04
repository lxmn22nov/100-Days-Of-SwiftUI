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
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var pinCode = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || pinCode.isEmpty {
            return false
        }
        return true
    }
    
    // pricing of cakes, computed property.
    var cost: Double {
        // 160 Rs per cake.
        var cost = Double(quantity) * 160
        
        // complicated cakes cost more.
        cost += (Double(type) / 2)
        
        // 80/cake for extra frosting.
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // 40/cake for sprinkles.
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
