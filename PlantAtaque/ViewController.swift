//
//  ViewController.swift
//  PlantAtaque
//
//  Created by Victor Leal Porto de Almeida Arruda on 24/09/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlet são uma representação dos elementos da intereface no código

    @IBOutlet weak var viewA: UIView!
    @IBOutlet weak var imagemA: UIImageView!
    @IBOutlet weak var nomePlantaA: UILabel!
    @IBOutlet weak var hpA: UILabel!
    @IBOutlet weak var ataqueA: UILabel!
    @IBOutlet weak var xpA: UILabel!
    @IBOutlet weak var nivelA: UILabel!
    
    @IBOutlet weak var viewB: UIView!
    @IBOutlet weak var imagemB: UIImageView!
    @IBOutlet weak var nomePlantaB: UILabel!
    @IBOutlet weak var hpB: UILabel!
    @IBOutlet weak var ataqueB: UILabel!
    @IBOutlet weak var xpB: UILabel!
    @IBOutlet weak var nivelB: UILabel!
    
    
    //Criando as palntas
    let cacto = Planta(nomeRecebido: "Cacto", hpRecebido: 200, xpRecebido: 30, forcaRecebida: 30, nivelRecebido: 0, imagemRecebida: #imageLiteral(resourceName: "cacto"), imagemBadRecebida: #imageLiteral(resourceName: "cacto_bad"), corRecebida: #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1))
    
    let ipe = Planta(nomeRecebido: "Ipê", hpRecebido: 100, xpRecebido: 0, forcaRecebida: 45, nivelRecebido: 0, imagemRecebida: #imageLiteral(resourceName: "ipe"), imagemBadRecebida: #imageLiteral(resourceName: "ipe_bad"), corRecebida: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
    
    let girassol = Planta(nomeRecebido: "Girassol", hpRecebido: 80, xpRecebido: 20, forcaRecebida: 75, nivelRecebido: 0, imagemRecebida: #imageLiteral(resourceName: "girassol"), imagemBadRecebida: #imageLiteral(resourceName: "girassol_bad"), corRecebida: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    
    let coqueiro = Planta(nomeRecebido: "Coqueiro", hpRecebido: 180, xpRecebido: 10, forcaRecebida: 55, nivelRecebido: 0, imagemRecebida: #imageLiteral(resourceName: "coqueiro"), imagemBadRecebida: #imageLiteral(resourceName: "coqueiro_bad"), corRecebida: #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1))
    
    //Criando o array para colocar as plantas
    var plantas: [Planta] = []
    
    //Vamos precisar de um indice para cada card A e B
    var indiceA = 0
    var indiceB = 0
    
    //viewDidLoad é a função chamada assim que a tela é carregada
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //colocando as plantas no array
        plantas.append(cacto)
        plantas.append(ipe)
        plantas.append(girassol)
        plantas.append(coqueiro)
        
        
    }
    
    @IBAction func passarA(_ sender: UIButton) {
        indiceA = indiceA + 1
        
        if indiceA >= plantas.count{
            indiceA = 0
        }
        
        viewA.backgroundColor = plantas[indiceA].corView
        imagemA.image = plantas[indiceA].imagem
        nomePlantaA.text = plantas[indiceA].nome
        hpA.text = "HP: " + String(plantas[indiceA].hp)
        ataqueA.text = "Ataque: " + String(plantas[indiceA].forcaAtaque)
        xpA.text = "XP: " + String(plantas[indiceA].xp)
        nivelA.text = "Nível " + String(plantas[indiceA].nivel)
        
       
    }
    
    @IBAction func passarB(_ sender: UIButton) {
        indiceB = indiceB + 1
        
        if indiceB >= plantas.count{
            indiceB = 0
        }
        
        viewB.backgroundColor = plantas[indiceB].corView
        imagemB.image = plantas[indiceB].imagem
        nomePlantaB.text = plantas[indiceB].nome
        hpB.text = "HP: " + String(plantas[indiceB].hp)
        ataqueB.text = "Ataque: " + String(plantas[indiceB].forcaAtaque)
        xpB.text = "XP: " + String(plantas[indiceB].xp)
        nivelB.text = "Nível " + String(plantas[indiceB].nivel)
        
    
    }
    
    //
    @IBAction func ataqueA(_ sender: UIButton) {
        
        let plantaAdversaria: Planta = plantas[indiceB]
        plantas[indiceA].atacar(plantaAdversaria: plantaAdversaria)
        
        //verificar se a planta A venceu para poder atribuir XP
        plantas[indiceA].venceu(plantaAdversaria: plantaAdversaria)
        
        //Atualizando os dados
        hpB.text = "HP: " + String(plantas[indiceB].hp)
        imagemB.image = plantas[indiceB].imagem
        xpB.text = "XP: " + String(plantas[indiceB].xp)
        
        
    }
    
    
    @IBAction func ataqueB(_ sender: UIButton) {
        
        let plantaAdversaria: Planta = plantas[indiceA]
        plantas[indiceB].atacar(plantaAdversaria: plantaAdversaria)
        
        //verificar se a planta B venceu para poder atribuir XP
        plantas[indiceB].venceu(plantaAdversaria: plantaAdversaria)
        
        //Atualizando os dados
        hpA.text = "HP: " + String(plantas[indiceA].hp)
        imagemA.image = plantas[indiceA].imagem
        xpA.text = "XP: " + String(plantas[indiceA].xp)
       
        
    }
    


}

