//
//  weapon.swift
//  P03_01_Jeu
//
//  Created by Nathalie Ortonne on 10/02/2020.
//  Copyright © 2020 Nathalie Ortonne. All rights reserved.
//

import Foundation


/////////////////////////
// Weapon
////////////////////////
class Weapon {
    var damage: Int
    var name: String
   
    //weapon propertie initialization
    init(damage:Int, name : String) {
        self.damage = damage
        self.name = name
    }
}


////////////
//different weapons who herite Weapon class
class Bow: Weapon {
    init () {
        super.init(damage: 20, name:"Wooden Arch")
    }
}

class Axe: Weapon {
    init() {
        super.init(damage: 35, name: "Stone Ax")
    }
}

class Sword: Weapon {
    
    init() {
        super.init(damage: 30, name:"Durandil Sword")
    }
}

class Septer: Weapon {
    init() {
        super.init(damage: 10, name:"Broom Handle")
    }
}

class LegendarySword: Weapon {
    init() {
        super.init(damage: 65, name: "Excalibur")
    }
}

class LegendarySepter: Weapon {
    init() {
        super.init(damage: 25, name: "Merlin Septer")
    }
}

class LegendaryBow: Weapon {
    init() {
        super.init(damage: 45, name: "Robin Hood Bow")
    }
}

class LegendaryAxe: Weapon {
    init() {
        super.init(damage: 85, name: "Ax of Moria")
    }
}

