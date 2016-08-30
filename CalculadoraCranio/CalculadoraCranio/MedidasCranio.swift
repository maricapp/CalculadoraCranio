//
//  MedidasCranio.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 24/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class CalcSingleton {
    
    static var medidasSuperior = [Float]()
    static var medidasAnterior = [Float]()
    static var medidasLateral = [Float]()
    static var medidasPosterior = [Float]()
    
    static let sharedInstance = CalcSingleton()
    
    private init() { }
    
    class func attribuirMedidasSuperior(handler: [Float]) {
        medidasSuperior = handler
        print("Valor \(medidasSuperior) atribuido para medidasSuperior em calculadora singleton ")
        print("")
    }
    
    class func attribuirMedidasAnterior(handler: [Float]) {
        medidasAnterior = handler
        print("Valor \(medidasAnterior) atribuido para medidasAnterior em calculadora singleton ")
        print("")
    }
    
    class func attribuirMedidasLateral(handler: [Float]) {
        medidasLateral = handler
        print("Valor \(medidasLateral) atribuido para medidasLateral em calculadora singleton ")
        print("")
    }
    
    class func attribuirMedidasPosterior(handler: [Float]) {
        medidasPosterior = handler
        print("Valor \(medidasPosterior) atribuido para medidasPosterior em calculadora singleton ")
        print("")
    }
    
    class func obterGenero() -> String {
        
        var genero:String = ""
        
        let sumSuperior = medidasSuperior.reduce(0, combine: +)
        print("Soma do array sumSuperior: \(sumSuperior)")
        print("")
        
        let sumAnterior = medidasAnterior.reduce(0, combine: +)
        print("Soma do array sumAnterior: \(sumAnterior)")
        print("")
        
        let sumLateral = medidasLateral.reduce(0, combine: +)
        print("Soma do array sumAnterior: \(sumLateral)")
        print("")
        
        let sumPosterior = medidasPosterior.reduce(0, combine: +)
        print("Soma do array sumPosterior: \(sumPosterior)")
        print("")
        
        
        let somaTotal = sumSuperior + sumAnterior + sumLateral + sumPosterior
        
        if  somaTotal < 50{
            genero = "-1"
        } else if somaTotal > 100{
            genero = "M"
        } else {
            genero = "F"
        }
        print("Genero: \(genero)")
        print("")
        return genero
    }

}

