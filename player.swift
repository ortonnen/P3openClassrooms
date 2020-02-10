//
//  player.swift
//  P03_01_Jeu
//
//  Created by Nathalie Ortonne on 10/02/2020.
//  Copyright © 2020 Nathalie Ortonne. All rights reserved.
//

import Foundation

//////////////////////////////
// Player
////////////////////////////
class Player {
    var name : String
    var playerTeam = [Character]()
    var enemyTeam = [Character]()
    
    // read-only computed property to calculate life team
    var lifeTeam: Int {
        var life: Int = 0
        for character in playerTeam {
            life += character.lifePoints
        }
        return life
    }
    
    //character properties initialization
    init (playerTeam: [Character], name: String) {
        self.playerTeam = playerTeam
        self.name = name
    }
    
    //enum to chose character type
    enum CharacterType: String {
        case Elf = "1"
        case Dwarf = "2"
        case Barbarian = "3"
        case Magician = "4"
        
        init?(whith index: String) {
            switch index {
            case "1":
                self = .Elf
            case "2":
                self = .Dwarf
            case "3":
                self = .Barbarian
            case "4":
                self = .Magician
            default:
               return nil
            }
        }
    }
    
    //method to addition a character in team
    func addACharacter (type: CharacterType, with name: String) {
        switch type {
        case .Elf:
            let character = Elf (name:name)
            playerTeam.append (character)
        case .Dwarf:
            let character = Dwarf (name:name)
            playerTeam.append (character)
        case .Barbarian:
            let character = Barbarian (name:name)
            playerTeam.append (character)
        case .Magician:
            let character = Magician (name:name)
            playerTeam.append (character)
        }
    }
}
