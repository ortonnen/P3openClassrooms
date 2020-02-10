//
//  main.swift
//  P03_01_Jeu
//
//  Created by Nathalie Ortonne on 29/01/2020.
//  Copyright © 2020 Nathalie Ortonne. All rights reserved.
//

import Foundation


////////////////
//Play Game

func playGame () {
    let start = Game()
    
    start.startGame()
    print("\n\n\n")
    start.fight()
    print("\n\n\n")
    start.winner()
    print("\n\n\n")
    
}


playGame()
