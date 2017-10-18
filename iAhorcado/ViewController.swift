//
//  ViewController.swift
//  iAhorcado
//
//  Created by CETYS on 17/10/17.
//  Copyright © 2017 CETYS. All rights reserved.
//

import UIKit

extension String {
    // charAt(at:) returns a character at an integer (zero-based) position.
    // example:
    // let str = "hello"
    // var second = str.charAt(at: 1)
    //  -> "e"
    func charAt(at: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: at)
        return self[charIndex]
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

class ViewController: UIViewController {
    
    //Declaracion de variables
    
    @IBOutlet weak var letrero: UILabel!
    @IBOutlet weak var pantalla: UIImageView!
    
    var boton : UIButton = UIButton()
    
    @IBOutlet weak var botonA: UIButton!
    @IBOutlet weak var botonB: UIButton!
    @IBOutlet weak var botonC: UIButton!
    @IBOutlet weak var botonD: UIButton!
    @IBOutlet weak var botonE: UIButton!
    @IBOutlet weak var botonF: UIButton!
    @IBOutlet weak var botonG: UIButton!
    @IBOutlet weak var botonH: UIButton!
    @IBOutlet weak var botonI: UIButton!
    @IBOutlet weak var botonJ: UIButton!
    @IBOutlet weak var botonK: UIButton!
    @IBOutlet weak var botonL: UIButton!
    @IBOutlet weak var botonM: UIButton!
    @IBOutlet weak var botonN: UIButton!
    @IBOutlet weak var botonÑ: UIButton!
    @IBOutlet weak var botonO: UIButton!
    
    @IBOutlet weak var botonP: UIButton!
    
    @IBOutlet weak var botonQ: UIButton!
    @IBOutlet weak var botonR: UIButton!
    @IBOutlet weak var botonS: UIButton!
    @IBOutlet weak var botonT: UIButton!
    @IBOutlet weak var botonU: UIButton!
    @IBOutlet weak var botonV: UIButton!
    @IBOutlet weak var botonW: UIButton!
    @IBOutlet weak var botonX: UIButton!
    @IBOutlet weak var botonY: UIButton!
    @IBOutlet weak var botonZ: UIButton!
    @IBOutlet weak var btnReinicio: UIButton!
    var estasVivo : Bool = true
    var palabraOculta : String = "oculto"
    var numeroFallos : Int = 0
    let listaPalabras = ["YAVIN", "FELUCIA", "CORUSCANT", "KAMINO", "TATOOINE", "SCARIF", "BESPIN", "NABOO", "JEDHA"]
    
    
    
    @IBAction func letras(_ sender: UIButton) {
       
        if estasVivo == true{
            boton = sender
            
            sender.isEnabled = false
            chequeaLetra(caracter: sender.currentTitle!)
        }
        
    }
    
    
    
    
    func eligePalabraAAdivinar(){
        
        let posicion = Int(arc4random_uniform(UInt32(listaPalabras.count)))
        
        palabraOculta = listaPalabras[posicion]
        
    }
    
    func ponerGuiones(){
        var guiones: String = ""
        print(palabraOculta)
        //var tamaño: Int = palabraOculta.length
        for var i in 0 ..< palabraOculta.characters.count{
            guiones = guiones + "_ "
            
            
        }
        letrero.text = guiones
    }
    
    func chequeaLetra( caracter:String){
        print(caracter)
        var palabraConGuiones : String = letrero.text!
        //var aux : String = palabraOculta as String
        
        if (palabraOculta.range(of: caracter) != nil) {
            print("he entrado")
            for var u in 0 ..< palabraOculta.characters.count{
                
                
                if palabraOculta.substring(with: u..<u+1) == caracter{
                   // palabraConGuiones.substring(with: u..<u+1)
                   print("Hasta la cocina")
                   //print(palabraOculta.substring(with: u..<u+1))
                   // palabraConGuiones = palabraConGuiones.replacingOccurrences(of: palabraConGuiones.substring(with: u..<u+1), with: caracter, options: .literal, range: nil)
                    
                    palabraConGuiones = palabraConGuiones.substring(to: u*2) + caracter + palabraConGuiones.substring(from: u*2+1)
                    
                    print(u)
                    print(palabraConGuiones)
                }
                
            }
            boton.backgroundColor = UIColor.green
            letrero.text = palabraConGuiones
        }
        else{
            numeroFallos += 1
            boton.backgroundColor = UIColor.red
            dibujaImagen(fallos: numeroFallos)
        }
        
        if palabraConGuiones.range(of: "_") != nil{
            
        }
        else{
            dibujaImagen(fallos: -1)
        }
    }
    
    func dibujaImagen(fallos:Int){
        
        switch fallos {
        case 0:
            pantalla.image = UIImage(named: "ahorcado_0.png")
        case 1:
            pantalla.image = UIImage(named: "ahorcado_1.png")
        case 2:
            pantalla.image = UIImage(named: "ahorcado_2.png")
        case 3:
            pantalla.image = UIImage(named: "ahorcado_3.png")
        case 4:
            pantalla.image = UIImage(named: "ahorcado_4.png")
        case 5:
            pantalla.image = UIImage(named: "ahorcado_5.png")
        case -1:
            pantalla.image = UIImage(named: "victoria.jpg")
            estasVivo = false
        default:
            pantalla.image = UIImage(named: "ahorcado_fin.png")
            estasVivo = false
            
        
        }
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
