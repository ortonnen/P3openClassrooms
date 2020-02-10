//
//  game.swift
//  P03_01_Jeu
//
//  Created by Nathalie Ortonne on 10/02/2020.
//  Copyright © 2020 Nathalie Ortonne. All rights reserved.
//

import Foundation

//////////////////////////
// Game
///////////////////////
class Game {
    let player1 = Player(playerTeam: [Character](), name: "")
    let player2 = Player(playerTeam: [Character](), name: "")
    var round = 0
    var nameUsed = [String]()
    var playerName = [String]()
    
    //methode for player to chose an unique name
    fileprivate func playerName (for player: Player) -> String? {
        var playerNameUsed : Bool = true
        while playerNameUsed {
            print ("Chose your player name :")
            if let name = readLine()?.lowercased() {
                    if playerName.contains(name) {
                        print ("The name \(name) is already exist."
                            + "\n Please enter another")
                        playerNameUsed = true
                    } else {
                        playerName.append(name)
                        playerNameUsed = false
                        return name
                }
            }
        }
        return nil
    }
        
    //method to describe chararcter
    fileprivate func description (for character: Character) {
        print ("The \(character) \(character.name) have \(character.weapon.name) causes \(character.self.weapon.damage) PA, HP \(character.lifePoints), restores \(character.carePoints) HP")
    }
    
    //method to have description of character before select him in player team
    private func composeYourTeam(){
        let elf = Elf (name: "")
        let dwarf = Dwarf (name: "")
        let barbarian = Barbarian (name: "")
        let magician = Magician (name: "")
        print ("Compose your team :")
        print ("\n.1 Elf ")
        elf.characterDescription()
        print ("\n.2 Dwarf ")
        dwarf.characterDescription()
        print ("\n.3 Barbarian ")
        barbarian.characterDescription()
        print ("\n.4 Magician")
        magician.characterDescription()
    }
    
    //method to create player Team
   private func createTeam (for player:Player) {
        while player.playerTeam.count < 3 {
            print ("\n")
                composeYourTeam()
            if let choice = readLine() {
                switch choice {
                case "1", "2", "3", "4" :
                    var newName: Bool = true
                    
           // chose a unique name for the character
                        while newName {
                            print ("Please chose a name for your character :")
                            if let name = readLine()?.uppercased() {
                                if nameUsed.contains(name) {
                                    print ("The name \(name) is already exist."
                                        + "\n Please enter another")
                                    newName = true
                                } else {
                                    nameUsed.append(name)
                                    if let characterType = Player.CharacterType(whith: choice) {
                                    player.addACharacter(type: characterType, with: name)
                                    newName = false
                                        print("You added \(characterType) to your team")
                                    }
                                }
                            }
                        }
                    default: print ("I don't understand your choice, please try again.")
                }
            }
        }
    }
    
    //method to know if character is alive
    private func characterAlive (for character : Character) -> Bool {
        let characterAlive: Bool = character.lifePoints > 0
        
        if characterAlive {
            return true
        } else {
            return false
        }
    }
    //method to select a character Alive
    private func selectAliveCharacter (for character : Character) {
        if characterAlive(for: character) == false {
            print ("DEAD")
        }
    }
    
    //method to describe character who attack
    fileprivate func attackerDescription (for character: Character) {
        print ("\(character.name) have \(character.weapon.name) causes \(character.self.weapon.damage) PA , HP \(character.lifePoints), and restaures \(character.carePoints) HP")
    }
    
    //method to select attacker
    private func printSelectableAttacker (for player: Player) {
        print ("Choose your attacker:")
        print ("\n.1", player.playerTeam[0].name )
        selectAliveCharacter(for: player.playerTeam[0])
        attackerDescription(for: player.playerTeam[0])
        print ("\n.2", player.playerTeam[1].name )
        selectAliveCharacter(for: player.playerTeam[1])
        attackerDescription(for: player.playerTeam[1])
        print ("\n.3" ,player.playerTeam[2].name)
        selectAliveCharacter(for: player.playerTeam[2])
        attackerDescription(for: player.playerTeam[2])
    }
    
  //method to chose attacker in team
    private func chooseAttacker (for player: Player) -> Character {
        var attacker = Character.empty()
        printSelectableAttacker(for: player)
        repeat {
            if let choice = readLine() {
                switch choice {
                case "1", "2", "3":
                    attacker = player.playerTeam[ Int(choice)!-1 ]
                    if characterAlive(for: attacker) == true {
                        print("You chose \(attacker.name)")
                        if chestRandom(for: attacker) == true {
                            attacker.weapon = changeWeapon(for: attacker)!
                            print ("Your attacker \(attacker.name) use \(attacker.weapon.name)")
                        }
                    } else {
                        print ("\(attacker.name) is dead, chose another")
                    }
                default:
                    print("Please choose an attacker between 1, 2, or 3. ")
                }
            }
        } while attacker.lifePoints <= 0
        return attacker
    }
    
    //method to describe enemy
    fileprivate func enemyDescription (for enemy: Character) {
        print ("\(enemy.name) have \(enemy.lifePoints) HP ")
    }
    
    //method to select enemy
    private func printSelectableEnemy(in enemy: Player) {
        print("Choose your enemy:"
            + "\n.1", enemy.playerTeam[0].name)
        selectAliveCharacter(for: enemy.playerTeam[0])
        enemyDescription(for: enemy.playerTeam[0])
        print ("\n.2", enemy.playerTeam[1].name)
        selectAliveCharacter(for: enemy.playerTeam[1])
        enemyDescription(for: enemy.playerTeam[1])
        print ("\n.3", enemy.playerTeam[2].name)
        selectAliveCharacter(for: enemy.playerTeam[2])
        enemyDescription(for: enemy.playerTeam[2])
    }
    
    //method to chose enemy in enemy Team
    private func chooseEnemy(for player : Player, in enemyTeam : Player ) -> Character {
        var enemy = Character.empty()
        
        printSelectableEnemy(in: enemyTeam)
        repeat {
            if let choice = readLine() {
                switch choice {
                case "1", "2", "3":
                    enemy = enemyTeam.playerTeam[Int(choice)!-1]
                    if characterAlive(for: enemy) == true {
                        print ("You chose to attack \(enemy.name)")
                    } else {
                        print ("\(enemy.name) is dead, chose another")
                    }
                default:
                    print (" Please chose an enemy to fight")
                }
            }
        } while enemy.lifePoints <= 0
        return enemy
    }
    
    //method to describe enemy
    fileprivate func allyDescription (for ally: Character){
        print ("\(ally.name) have \(ally.lifePoints) HP ")
    }
    
    //method to select enemy
    private func printSelectableAlly (in ally: Player) {
       
        print("Choose your ally:"
             + "\n.1", ally.playerTeam[0].name)
        selectAliveCharacter(for: ally.playerTeam[0])
        allyDescription(for: ally.playerTeam[0])
        print ("\n.2", ally.playerTeam[1].name)
        selectAliveCharacter(for: ally.playerTeam[1])
        allyDescription(for: ally.playerTeam[1])
        print ("\n.3", ally.playerTeam[2].name)
        selectAliveCharacter(for: ally.playerTeam[2])
        allyDescription(for: ally.playerTeam[2])
    }
    
    //method to choose an ally in your team
    private func chooseAlly(for player: Player)->Character{
        var ally = Character.empty()
       
       printSelectableAlly(in: player)
        
        repeat {
            if let choice = readLine(){
                switch choice {
                case "1","2","3":
                    ally = player.playerTeam[Int(choice)!-1]
                    if characterAlive(for: ally) == true {
                        print("You chose \(ally.name)")
                        
                    } else {
                        print("\(ally.name) is dead chose another")
                    }
                default:
                    print ("Please chose an ally to heal")
                }
            }
        } while ally.lifePoints <= 0
        return ally
    }
     
    //method to play againts other player
    private func play(for player: Player,against enemy: Player) {
        
        let attacker = chooseAttacker(for: player)
        
        print("Chose an action to play"
            + "\n.1 Attack an enemy"
            + "\n.2 Heal an ally ")

            if let choice = readLine() {
                repeat {
                    switch choice {
                    case "1":
                        let enemy = chooseEnemy(for: player, in: enemy)
                        attacker.attack(enemy: enemy)
                        print ("You attack \(enemy.name) whith \(attacker.name),"
                            + " \(enemy.name) have now \(enemy.lifePoints) HP ")
                    case "2":
                        let ally = chooseAlly(for: player)
                        attacker.heal(ally: ally)
                        print("You Heal \(ally.name) with \(attacker.name), "
                            + "\(ally.name) have now \(ally.lifePoints) HP")
                    default:
                        print ("Please chose an action between 1 or 2")
                    }
                } while choice != "1" && choice != "2"
        }
    }

    // the method to make a chest appear randomly
    private func chestRandom(for character : Character) -> Bool {
        let chestAppear = Bool.random()
       
        if chestAppear {
            print ("One Chest is appeared before You ")
            return true
        } else {
            return false
        }
    }
    
    //method to make new weapon appear rendomly
    private func newWeapon (for character : Character) -> Weapon {
        let weaponArray = [Sword(), Bow(), Axe(), Septer(), LegendaryAxe(), LegendaryBow(), LegendarySword(), LegendarySepter()]
        let newWeapon = weaponArray.randomElement()
        print ("The chest contains \(newWeapon!.name) with causes \(newWeapon!.damage) PA")
            return newWeapon!
    }
    
    //method to change weapon
    private func changeWeapon(for character: Character) -> Weapon? {
        let newCharacterWeapon = newWeapon(for: character)
        print("Do you want to change weapon?"
        + "\n Yes"
        + "\n No")
        if let choice = readLine()?.uppercased() {
            if choice == "Yes" || choice == "Y" {
                print ("\(newCharacterWeapon.name) cause \(newCharacterWeapon.damage) points of damage")
                return newCharacterWeapon
            } else {
                return character.weapon
            }
        }
        return nil
    }
    // methode for naming player
    func namingPlayer (for player : Player){
        player.name = playerName(for: player)!
    }
    // method for player 1 and player 2 to choose their team
    func startGame() {
        print ("Player 1 :")
        namingPlayer(for: player1)
        createTeam(for: player1)
        print (player1.playerTeam)
        print (player1.lifeTeam)
       
        print("\n")

        print ("Player 2:")
        namingPlayer(for: player2)
        createTeam(for: player2)
        print (player2.playerTeam)
        print (player2.lifeTeam)
    }
    
    //method to fight between player
    func fight () {
        while player1.lifeTeam >= 1 && player2.lifeTeam >= 1 {
            print (round += 1)
            if player1.lifeTeam > 0 {
                print(player1.name)
                play(for: player1, against: player2)
            }
            
            print ("\n")
            
            if player2.lifeTeam > 0 {
                print (player2.name)
                play(for: player2, against: player1)
            }
        }
    }
    
    // method to have statistique of player Team
    fileprivate func Stat (for player : Player) {
        
        description(for: player.playerTeam[0])
        description(for: player.playerTeam[1])
        description(for: player.playerTeam[2])
    }

    //method to have statistique of game
    fileprivate func gameStat (for player : Player) {
        
        print ("\(player.name) Won !!! ")
        print ("\n")
        print ("Statistique")
        print ("\n Number of round : \(round)")
        print ("\(player1.name)")
        Stat(for: player1)
        print ("\n")
        print ("\(player2.name)")
        Stat(for: player2)
    }
    // method at the end of the game to determine the winner and display the statistics of the game
    func winner() {
    
        if player1.lifeTeam > player2.lifeTeam {
            
            gameStat(for: player1)
        } else {
            print ("Player 2 Won !!!")
            gameStat(for: player2)
        }
    }
}
