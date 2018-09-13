//
//  NumberCard.swift
//  AppleTVGame
//
//  Created by Guilherme Vassallo on 13/09/2018.
//  Copyright © 2018 Felipe Kestelman. All rights reserved.
//

import Foundation
import SpriteKit

class NumberCard {
    
    var cardBG: UIImage!
    let numberValue: Float!
    var numberDisplay: String?
    
    
    func convertNumber(value: Float){
        let possibility = arc4random_uniform(2) + 1
        
        switch possibility {
        case 1: //só mostra o número como o valor decimal
            
            self.numberDisplay = "\(value)"
            
        case 2: //mostra número como porcentagem
            
            let cardString = "\(100 * value)%"
            self.numberDisplay = cardString
            
        case 3: //mostra o número como fração
            
            var denominator = Int(100 * value)
            var numerator = 100
            let divider = 2
            
            (denominator, numerator) = findMinMultiplier (denominator: denominator, numerator: numerator, divider: divider) //acha o mmc da fração
            
            self.numberDisplay = "\(denominator)/\(numerator)"
            
        default:
            self.numberDisplay = "U DONE F****** IT UP"
        }
}
    
    
    
    func changeBG (correct: Bool){
        if correct == true{
            self.cardBG = UIImage(named: "---NOME DO CARTÃO VERDE AQUI---")
        }
        else{
            self.cardBG = UIImage(named: "---NOME DO CARTÃO VERMELHO AQUI---")
        }
    }
    
    
    
    
    
    init(cardBG: UIImage, numberValue: Float, numberDisplay: String){
        self.cardBG = UIImage(named: "cardBG")
        self.numberValue = numberValue
    }
    
    
    
}




//essa função não faz parte da classe
func findMinMultiplier (denominator: Int, numerator: Int, divider: Int) -> (Int, Int){
    if denominator % divider > 0 || numerator % divider > 0 {
        return (denominator, divider)
    }
    else{
        let newDivider = divider + 1
        return findMinMultiplier(denominator: denominator, numerator: numerator, divider: newDivider)
    }
}
