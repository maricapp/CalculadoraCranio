//
//  SuperiorTableViewController.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 24/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class SuperiorTableViewController: UITableViewController {
    
    var medicoes = [String]()
    var valores = [Float]()
    var urls = [String]()
    
    var lastSelectIndex = 0
    let resultadoTopo: UIButton = UIButton()
    @IBOutlet weak var lblResultado: UIBarButtonItem!
    
    
    func adicionaMedicoes(){
        medicoes.append("Angulo da Concavidade Frontal")
        medicoes.append("Comprimento Maximo do Cranio")
        medicoes.append("Largura Maxima do Cranio (Bieurio)")
        medicoes.append("Altura Basion-Bregma")
        medicoes.append("Comprimento Basion-Nasion")
        medicoes.append("Comprimento Basion-Prosthion")
        medicoes.append("Corda Frontal")
    }
    
    func adicionaValoresIniciais(){
        valores.append(0)
        valores.append(0)
        valores.append(0)
        valores.append(0)
        valores.append(0)
        valores.append(0)
        valores.append(0)
    }
    
    func adicionaUrls(){
        urls.append("https://en.m.wikipedia.org/wiki/Parietal_bone")
        urls.append("https://en.m.wikipedia.org/wiki/Parietal_bone")
        urls.append("https://en.m.wikipedia.org/wiki/Parietal_bone")
        urls.append("https://en.m.wikipedia.org/wiki/Parietal_bone")
        urls.append("https://en.m.wikipedia.org/wiki/Parietal_bone")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResultado.title = ""
        
        adicionaMedicoes()
        adicionaValoresIniciais()
        adicionaUrls()
        
        resultadoTopo.setImage(UIImage(named: "nd32.png"), forState: UIControlState.Normal)
        resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
        let barButton = UIBarButtonItem(customView: resultadoTopo)
        self.navigationItem.rightBarButtonItem = barButton
        
        let genero = CalcSingleton.obterGenero()
        atualizaIcone(genero)
        
        CalcSingleton.buscar()
    }
    
    override func viewDidAppear(animated: Bool) {
        let genero = CalcSingleton.obterGenero()
        atualizaIcone(genero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicoes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SuperiorTableViewCell", forIndexPath: indexPath) as! SuperiorTableViewCell
        cell.cellLabel.text = medicoes[indexPath.item]
        cell.edtValor.tag = indexPath.row
        cell.edtValor.addTarget(self, action: "sentEventsEditingDidEnd:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    @IBAction func sentEventsEditingDidEnd(sender: UITextField) {
        
        let posicao = sender.tag
        let valorDigitado:String? = sender.text
        var valor: Float = 0
        
        if (valorDigitado != nil)
        {
            valor  = NSString(string: valorDigitado!).floatValue
            valores[posicao] = valor
        }
        
        CalcSingleton.attribuirMedidasSuperior(valor, areaNome: medicoes[posicao])
        let genero = CalcSingleton.obterGenero()
        
        atualizaIcone(genero)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetalheSuperior"
        {
            let destinationVC = segue.destinationViewController as! DetalhesViewController
            
            destinationVC.mensagem = medicoes[sender!.tag]
            destinationVC.url = urls[sender!.tag]
        }
    }

    func atualizaIcone(genero:String){
        if genero == "F" {
            resultadoTopo.setImage(UIImage(named: "female32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        } else if genero == "M" {
            resultadoTopo.setImage(UIImage(named: "male32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        } else if genero == "-1" {
            resultadoTopo.setImage(UIImage(named: "nd32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        }
        
    }
}

