//
//  ViewController.swift
//  iAhorcado
//
//  Created by CETYS on 17/10/17.
//  Copyright © 2017 CETYS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Declaracion de variables	
    
    @IBOutlet weak var letrero: UILabel!
    @IBOutlet weak var pantalla: UIImageView!
    
    var palabraOculta : String = "oculto"
    var numeroFallos : Int = 0
    let listaPalabras = ["YAVIN", "FELUCIA", "CORUSCANT", "KAMINO", "TATOOINE", "SCARIF", "BESPIN", "NABOO", "JEDHA"]
    
    
    @IBAction func letras(_ sender: UIButton) {
        
    }
    
    func eligePalabraAAdivinar(){
        
        let posicion = Int(arc4random_uniform(UInt32(listaPalabras.count)))
        
        palabraOculta = listaPalabras[posicion]
        
    }
    
    func ponerGuiones(){
        var guiones: String = ""
        for i in 0 < palabraOculta.characters.count{
            guiones += guiones + "_"
        }
        letrero.text = guiones
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eligePalabraAAdivinar()
        ponerGuiones()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

