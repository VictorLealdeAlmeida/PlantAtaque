//
//  ModeloPlanta.swift
//  PlantAtaque
//
//  Created by Victor Leal Porto de Almeida Arruda on 24/09/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

//Aqui vamos criar o modelo do nosso card
//Todas as informações de propriedade e de ações das Plantas precisam conter na class Planta

class Planta{
    
    var nome: String
    var hp: Int
    var xp: Int
    var forcaAtaque: Int
    var nivel: Int
    var imagem: UIImage
    var imagemBad: UIImage
    var corView: UIColor
    
    
    //O init é reponsável por receber os dados e preencher os atributos da classe
    //O init é o que chamamos de construtor
    init(nomeRecebido: String, hpRecebido: Int, xpRecebido: Int, forcaRecebida: Int, nivelRecebido: Int, imagemRecebida: UIImage, imagemBadRecebida: UIImage, corRecebida: UIColor) {
        self.nome = nomeRecebido
        self.hp = hpRecebido
        self.xp = xpRecebido
        self.forcaAtaque = forcaRecebida
        self.nivel = nivelRecebido
        self.imagem = imagemRecebida
        self.imagemBad = imagemBadRecebida
        self.corView = corRecebida
    }
    
    //func respnsável por tirar o hp da planta ao receber o ataque
    func receberAtaque(forcaAtaque: Int){
        hp = hp - forcaAtaque
        
        //Mudar a imagem quando a planta morrer
        if hp < 0{
            imagem = imagemBad
        }
    }
    
    //func responsável por tirar o hp do adversário com base na força do ataque da planta
    //Para isso é chamado a função receber ataque do adversário
    func atacar(plantaAdversaria: Planta){
        plantaAdversaria.receberAtaque(forcaAtaque: forcaAtaque)
    }
    
    func venceu(plantaAdversaria: Planta){
        if plantaAdversaria.hp < 0{
            xp = xp + 10
        }
    }
    
    
    
    
}
