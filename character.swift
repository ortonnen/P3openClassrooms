//
//  character.swift
//  P03_01_Jeu
//
//  Created by Nathalie Ortonne on 10/02/2020.
//  Copyright © 2020 Nathalie Ortonne. All rights reserved.
//

import Foundation

//////////////////////////////////////
// Character
/////////////////////////////////////
class Character {
    var name: String
    var weapon: Weapon
    var lifePoints: Int
    var carePoints: Int
    
    //character properties initialization
    init (name: String, weapon: Weapon, lifePoints: Int, carePoints: Int ) {
        self.name = name
        self.weapon = weapon
        self.lifePoints = lifePoints
        self.carePoints = carePoints
    }
    
    //method which describes the character characteristics
     func characterDescription() {
        print ("Arm: \(weapon.name) causes \(weapon.damage) pts of damage ")
        print ("Life: \(lifePoints) pts")
        print ("treatment points: \(carePoints) pts")
    }
    
    //method of attacking an enemy
     func attack(enemy: Character) {
        enemy.receive(damage: self.weapon.damage)
        print("\n")
        print("You attack with \(weapon.name) and causes \(self.weapon.damage) points of damage" )
    }
    
    //method for receive damage
    func receive(damage: Int) {
       lifePoints -= damage
        if self.lifePoints < 0 {
            self.lifePoints = 0
               }
    }
    
    //method of heal an ally
     func heal(ally: Character) {
        ally.care(carePoints: self.carePoints)
        print ("You heal by \(self.carePoints) care Points ")
    }
    
    //method for receive care
     func care(carePoints: Int) {
        lifePoints += carePoints
        if self.lifePoints < 0 {
            lifePoints = 0
        }
    }
    
    //method for create a empty character
    static func empty() -> Character {
        return Character(name: "", weapon: Weapon(damage: 0, name: ""), lifePoints: 0, carePoints: 0)
    }
}


//////////////
//different characters who herite Character class
class Elf: Character {
    init(name:String) {
        super.init(name: name, weapon: Bow(), lifePoints: 90, carePoints: 20)
    }
}

class Dwarf: Character {
    init(name:String) {
        super.init(name: name, weapon: Axe(), lifePoints: 130, carePoints: 5)
    }
}


class Magician: Character {
    init(name:String) {
        super.init(name: name, weapon: Septer(), lifePoints: 80, carePoints: 45)
    }
}

class Barbarian: Character {
    init(name:String) {
        super.init(name: name, weapon: Sword(), lifePoints: 140, carePoints: 10)
    }
}
