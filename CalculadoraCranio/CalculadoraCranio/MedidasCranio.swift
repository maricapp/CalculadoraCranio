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
    
    static var tudoDoExcel = TudoDoExcel()
    static var resultados = Resultados()
    
    static let sharedInstance = CalcSingleton()
    
    private init()
    {
    }
    
    class func buscar(){
        
        tudoDoExcel = TudoDoExcel()
        
        let url = NSURL(string: "https://craniowebapi.herokuapp.com/api/obtertudo")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            tudoDoExcel = self.parseJson(data!)
            print(tudoDoExcel)
        }
        
        //tudo.obterGenero()
        
        task.resume()
    }
    
    
    class func attribuirMedidasSuperior(valorDigitado: Float, areaNome: String) {
        tudoDoExcel.obterGeneroDaArea(valorDigitado, areaNome: areaNome, resultados: resultados)
        
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
    
    class func obterMediaSuperior() {
        
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
        
        let mediaNova = resultados.calcularMedia()
    
        return mediaNova
    }
    
    class func parseJson(data: NSData) -> TudoDoExcel
    {
        let tudoDoExcel = TudoDoExcel()
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let resultado = json["resultado"] as? [[String: AnyObject]] {
                
                
                for medida in resultado {
                    let linhaExcel = LinhaExcel()
                    if let areaNome = medida["AreaNome"] as? String {
                        linhaExcel.areaNome = areaNome
                        //print(areaNome)
                    }
                    if let cutPointNome = medida["CutPointNome"] as? String {
                        linhaExcel.cutPointNome = cutPointNome
                        //print(cutPointNome)
                    }
                    if let operador = medida["Operador"] as? String {
                        linhaExcel.operador = operador
                        //print(operador)
                    }
                    if let cutPointValor = medida["CutPointValor"] as? Float {
                        linhaExcel.cutPointValor = cutPointValor
                        //print(cutPointValor)
                    }
                    if let feminino = medida["Feminino"] as? Float {
                        linhaExcel.feminino = feminino
                        //print(feminino)
                    }
                    if let masculino = medida["Masculino"] as? Float {
                        linhaExcel.masculino = masculino
                        //print(masculino)
                    }
                    if let ordenador = medida["Ordenador"] as? Int {
                        linhaExcel.ordenador = ordenador
                        //print(ordenador)
                    }
                    tudoDoExcel.adicionaLinhaExcel(linhaExcel)
                    print("linhaExcel")
                    print(linhaExcel)
                }
                print("********************medidaReferencia")
                //print(tudoDoExcel.linhas[1864].areaNome)
                //print(tudoDoExcel.linhas[1864].cutPointValor)
                //print(tudoDoExcel.linhas[1866].areaNome)
                //print(tudoDoExcel.linhas[1866].cutPointValor)
                //print(medidaReferencia.linhas[1866].cutPointValor)
                //print(medidaReferencia.linhas[1866].operador)
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        print("teste")
        return tudoDoExcel
    }
}

/*
 cada objeto dessa classe faz referencia a um registro da tabela Area_CutPointNome do banco
 */
class TudoDoExcel {
    
    //var areaNome:String = ""
    var linhas = [LinhaExcel]()
    
    func adicionaLinhaExcel(linha: LinhaExcel){
        linhas.append(linha)
    }
    
    func obterGeneroDaArea(valorDigitado: Float, areaNome: String, resultados: Resultados){
        //let results = linhas.lazy.filter { c in c.areaNome == areaNome && c.cutPointValor < valorDigitado }
                // or instead of "c in", you can use $0:
                //.map { ($0.someProperty, $0.otherProperty) }
        
        var fem:Float = 0
        var masc:Float = 0
        
        for linha in linhas {
            if (linha.areaNome == areaNome && linha.cutPointValor == valorDigitado) {
                fem = linha.feminino
                masc = linha.masculino
            }
            
        }
        
        resultados.addFem(fem)
        resultados.addMasc(masc)
        
        print("****************    fem    ***********")
        print(fem)
        print("****************    masc    ***********")
        print(masc)

    }
    
    //func setAreaNome(nome: String){
    //    areaNome = nome
    //}
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

class Resultados {
    var superiorFem = [Float]()
    var superiorMasc = [Float]()
    
    var femFinal = Float()
    var mascFinal = Float()
    
    func addFem (valor: Float){
        superiorFem.append(valor)
    }
    
    func addMasc (valor: Float){
        superiorMasc.append(valor)
    }
    
    func calcularMedia()-> String{
        femFinal = superiorFem.reduce(0, combine: +)
        mascFinal = superiorMasc.reduce(0, combine: +)
        var genero: String
        if (femFinal > mascFinal){
            genero = "F"
        } else if (mascFinal > femFinal){
            genero = "M"
        } else {
            genero = "X"
        }
        
        return genero
        
    }
}

