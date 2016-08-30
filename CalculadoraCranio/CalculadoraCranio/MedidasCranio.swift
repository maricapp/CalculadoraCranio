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
    
    class func obterGenero() -> String {
        
        var genero:String = ""
        
        let sumSuperior = medidasSuperior.reduce(0, combine: +)
        print("Soma do array sumSuperior: \(sumSuperior)")
        print("")
        
        let sumAnterior = medidasAnterior.reduce(0, combine: +)
        print("Soma do array sumAnterior: \(sumAnterior)")
        print("")
        
        if sumSuperior + sumAnterior < 50{
            genero = "-1"
        } else if sumSuperior + sumAnterior > 100{
            genero = "M"
        } else {
            genero = "F"
        }
        print("Genero: \(genero)")
        print("")
        return genero
    }

}

class Calculadora: NSObject {
    
    var medidasSuperior: [Float]
    var medidasAnterior: [Float]
    //var medidasLateral: [Float]
    
    override init(){
        medidasSuperior = [Float](count: 1, repeatedValue: 0.0)
        medidasAnterior = [Float](count: 1, repeatedValue: 0.0)
    }
    
    func attribuirMedidasSuperior(valor: [Float]) {
        medidasSuperior = valor
    }
    
    func attribuirMedidasAnterior(valor: [Float]) {
        medidasAnterior = valor
    }
    
    func obterGenero() -> String {
        
        var genero:String = ""
        
        let sumSuperior = medidasSuperior.reduce(0, combine: +)
        let sumAnterior = medidasAnterior.reduce(0, combine: +)
        if sumSuperior + sumAnterior < 50{
            genero = "-1"
        }else if sumSuperior + sumAnterior > 100{
            genero = "M"
        } else {
            genero = "F"
        }
        
        return genero
    }
}

class MedidasCranio: NSObject {
    //variaveis
    var med1_AngulodaConcavidadeFrontal: Float?
    var med2_ComprimentoMaximodoCranio: Float?
    var med3_LarguraMaximadoCranio_Bieurio: Float?
    var med4_AlturaBasion_Bregma: Float?
    var med5_ComprimentoBasionNasion: Float?
    var med6_ComprimentoBasionProsthion: Float?
    var med7_CordaFrontal: Float?
    var med8_CordaParietal: Float?
    var med9_LarguraFacialSuperior: Float?
    var med10_AlturaFacialSuperior: Float?
    var med11_MinimaLarguraFrontal: Float?
    var med12D_LarguraOrbital: Float?
    var med12E_LarguraOrbital: Float?
    var med13D_AlturaOrbital: Float?
    var med13E_AlturaOrbital: Float?
    var med14_LarguraOrbitalMedia: Float?
    var med15_LarguraInterorbital: Float?
    var med16_LarguraBiorbital: Float?
    var med17_LarguraInterorbital_Frontal: Float?
    var med18_AlturaNasal: Float?
    var med19_LarguraNasal: Float?
    var med20_LarguraBizigomatica: Float?
    var med21_LarguraZigomaxilar: Float?
    var med22D_ArcoVerticalMinimo: Float?
    var med22E_ArcoVerticalMinimo: Float?
    var med23D_ComprimentoOssoZigomaticoMaximo: Float?
    var med23E_ComprimentoOssoZigomaticoMaximo: Float?
    var med24D_ComprimentoZygoorbitalePorion: Float?
    var med24E_ComprimentoZygoorbitalePorion: Float?
    var med25D_ComprimentoAsterionPorion: Float?
    var med25E_ComprimentoAsterionPorion: Float?
    var med26D_ComprimentoPorionMastoidale: Float?
    var med26E_ComprimentoPorionMastoidale: Float?
    var med27D_ComprimentoAsterionMastoidale: Float?
    var med27E_ComprimentoAsterionMastoidale: Float?
    var med28D_ComprimentoMastoide: Float?
    var med28E_ComprimentoMastoide: Float?
    var med29_LarguraBiauricular: Float?
    var med30_LarguraBiasterica: Float?
    var med31_CordaOcciptal: Float?
    var med32_CordaLambdaInion: Float?
    var med33D_MaximoComprimentoCondiloOccipital: Float?
    var med33E_MaximoComprimentoCondiloOccipital: Float?
    var med34D_MaximaLarguraCondiloOccipital: Float?
    var med34E_MaximaLarguraCondiloOccipital: Float?
    var med35_ComprimentoForameMagno: Float?
    var med36_LarguraForameMagno: Float?
    var med37_LarguraPalatal: Float?
    var med38_ComprimentoPalatal: Float?
    var med39_MaximaLarguraAlveolar: Float?
    var med40_MaximoComprimentoAlveolar: Float?
    var med41_AlturaMento: Float?
    var med42D_AlturadoCorpoMandibular: Float?
    var med42E_AlturadoCorpoMandibular: Float?
    var med43D_EspessuraCorpoMandibular: Float?
    var med43E_EspessuraCorpoMandibular: Float?
    var med44_LarguraMandibularAnterior: Float?
    var med45_LarguraBicoronoide: Float?
    var med46_LarguraBicondiliana: Float?
    var med47D_LarguraIncisuraMandibular: Float?
    var med47E_LarguraIncisuraMandibular: Float?
    var med48_LarguraMaximaRamoMandibular: Float?
    var med49_LarguraMaximaRamoMandibular: Float?
    var med50D_AlturaRamoMandibular: Float?
    var med50E_AlturaRamoMandibular: Float?
    var med51_Comprimentototalmandibular: Float?
    var med52_LarguraBigoniaca: Float?
    var med53_ComprimentodaMandibula_Projecao: Float?
    var med54D_AnguloMandibular: Float?
    var med54E_AnguloMandibular: Float?
    var med55D_ProfundidadeIncisuraMandibular: Float?
    var med55E_ProfundidadeIncisuraMandibular: Float?
}