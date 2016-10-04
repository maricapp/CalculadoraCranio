//
//  MedidasCranio.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 24/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CalcSingleton {
    
    static var medidasSuperior = [Float]()
    static var medidasAnterior = [Float]()
    static var medidasLateral = [Float]()
    static var medidasPosterior = [Float]()
    
    static let sharedInstance = CalcSingleton()
    
    private init()
    {

    }
    
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
        
        var generoApi:String = ""
        
        print("Aqui!!!!!")
        let conditionRef = FIRDatabase.database().reference().child("rangeFem").child("begin")
        conditionRef.observeEventType(.Value){(snap: FIRDataSnapshot) in
            print(snap.value?.description)
        }
        print("FIIIIM!!!!!")
        
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
        
        if somaTotal < 50 {
            genero = "-1"
        } else if somaTotal > 100 {
            genero = "M"
        } else {
            genero = "F"
        }
        print("Genero: \(genero)")
        print("")
        
        print("Soma: \(somaTotal)")
        print("")
        
    
        
        let url = NSURL(string: "https://craniowebapi.herokuapp.com/api/obtertudo")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            self.parseJson(data!)
        }
        
        task.resume()
    
    
        return generoApi
        
    }
    
    class func parseJson(data: NSData)
    {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let resultado = json["resultado"] as? [[String: AnyObject]] {
                
                var linhaExcel = LinhaExcel()
                
                for medida in resultado {
                    if let areaNome = medida["AreaNome"] as? String {
                        linhaExcel.areaNome = areaNome
                        print(areaNome)
                    }
                    if let cutPointNome = medida["CutPointNome"] as? String {
                        linhaExcel.cutPointNome = cutPointNome
                        print(cutPointNome)
                    }
                    if let operador = medida["Operador"] as? String {
                        linhaExcel.operador = operador
                        print(operador)
                    }
                    if let cutPointValor = medida["CutPointValor"] as? Float {
                        linhaExcel.cutPointValor = cutPointValor
                        print(cutPointValor)
                    }
                    if let feminino = medida["Feminino"] as? Float {
                        linhaExcel.feminino = feminino
                        print(feminino)
                    }
                    if let masculino = medida["Masculino"] as? Float {
                        linhaExcel.masculino = masculino
                        print(masculino)
                    }
                    if let ordenador = medida["Ordenador"] as? Int {
                        linhaExcel.ordenador = ordenador
                        print(ordenador)
                    }
                    print("linhaExcel")
                    print(linhaExcel)
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
    }
}

class LinhaExcel  {
    var areaNome:String = ""
    var cutPointNome:String = ""
    var operador:String = ""
    var cutPointValor:Float = 0.0
    var feminino:Float = 0.0
    var masculino:Float = 0.0
    var ordenador:Int = 0
}

class MedidaDaqui {
    var nome:String = ""
    var linhas = [LinhaExcel]()
    
    
    
    func adicionaLinhaExcel(LinhaExcel: linha){
        linhas.append(linha)
    }

}

