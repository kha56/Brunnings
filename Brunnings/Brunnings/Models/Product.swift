//
//  Product.swift
//  Brunnings
//
//  Created by Ivan Kha on 22/5/2023.
//

import Foundation

struct Product: Identifiable, Hashable
{
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var description: String
    //var quantity: Int = 1
}

var productList = [Product(name: "Shovel", image: "Tool1", price: 15, description: "This is the top notch Shovel"),
                    Product(name: "Big Shovel", image: "Tool2", price: 22, description: "This is the top notch Big Shovel"),
                    Product(name: "Hammer", image: "Tool3", price: 15, description: "This is the top notch Hammer"),
                    Product(name: "Fork", image: "Tool4", price: 44, description: "This is the top notch Fork"),
                    Product(name: "Mini-Saw", image: "Tool5", price: 21, description: "This is the top notch Mini-Saw"),
                    Product(name: "Brunch Cutter", image: "Tool6", price: 5, description: "This is the top notch Brunch Cutter")]
