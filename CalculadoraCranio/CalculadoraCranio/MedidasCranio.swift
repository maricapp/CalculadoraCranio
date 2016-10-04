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
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://craniowebapi.herokuapp.com/api/obtergenero")!)
        request.HTTPMethod = "POST"
        let postString = "valor=\(String(somaTotal))&area_nome=Angulo da Concavidade Frontal&cut_point_nome=br1"
        
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {
                
                print("Status code \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            print("************************")
            print("responseString = \(self.parseJson(data!))")
            print("")
            
            generoApi = parseJson(data!)
        }
        task.resume()
    
    
        return generoApi
        
    }
    
    class func parseJson(data: NSData) -> String
    {
        var probFeminino:Float = 0.0
        var probMasculino:Float = 0.0
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let resultado = json["resultado"] as? [String: AnyObject] {
                if let nameF = resultado["Feminino"] as? Float {
                    probFeminino = nameF
                    print("-----Feminino-----")
                    print(nameF)
                } else {
                    print("*/*******name")
                }
                if let nameM = resultado["Masculino"] as? Float {
                    probMasculino = nameM
                    print("-------Masculino---")
                    print(nameM)
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        
        if (probFeminino > probMasculino) {
            return "Feminino"
        } else if (probFeminino < probMasculino) {
            return "Masculino"
        } else {
            return "Empate"
        }
    }

}

