//
//  vcPreguntas.swift
//  EX01_P1
//
//  Created by DANIEL SALDANA on 18/03/23.
//

import Cocoa

class vcPreguntas: NSViewController {

    var nivel:String?
    var status:String?
    var vidas:Int = 0
    var contLimite:Int = 0
    var contadorCorrectas:Int = 0
    var contadorIntentos:Int = 0
    var contadorPreguntas:Int = 0
    var ganadas:Int = 0
    var limite:Int = 0
    var rachaGeneral:Int = 0
    var rachaGlobal:Int = 0
    var i:Int = 29
    var imgVidas: [String] = ["corazones4", "corazones3","corazones2","corazones1"]
    var imgPreguntas:[String] = ["atari2600", "hongorojo", "Apu", "amazon", "disney", "sonic", "beatles", "waluigi", "ornitorrinco", "raizcuadrada", "undertaker", "sony", "mariones", "ocarina", "gtav", "minecraft", "fornite", "asasin", "pokemonblue", "the_elder", "god_of_war", "call_of", "the_last", "SmashBall", "shadow", "overwatch", "metal", "fifa", "resident", "red_dead"]
    var preguntas: [String] = ["¿En 1977 salió la Atari 2600?","¿Es cierto que el hongo rojo de Mario Bros lo hace más grande?","¿En los Simpson la persona que más odia Homero es Appu?","¿Amazon es una empresa de coches?","¿La mascota de Disney es un pato llamado Lucas?","¿Sonic the Hedgehog es un perro?","¿La canción Lucy es de los Beatles?","¿Wualuigi aparece en Smash Bros como luchador?","¿Los ornitorrincos son mamíferos?","¿La raíz cuadrada de 144 es 12?","¿El undertaker es un luchador?", "¿Sony es una marca de tenis?", "El primer videojuego de Mario Bros. fue lanzado en 1985 para la \n consola Nintendo Entertainment System (NES)", "The Legend of Zelda: Ocarina of Time fue lanzado originalmente \n para la consola Nintendo 64 en 1998?", "Grand Theft Auto V es el tercer videojuego más \n vendido de todos los tiempos, detrás de Minecraft y Tetris?", "Minecraft es un juego de mundo lineal \n en el que los jugadores pueden construir y explorar con reglas?", "Fortnite es un juego battle royal?", "Ezio Auditore es el personaje principal de la trilogía \n Assassin's Creed II Assassin's Creed: Brotherhood y \n Assassin's Creed: Revelations?", "Pokémon Red and Blue fue lanzado originalmente para la \n consola Game Boy en 1996?", "The Elder Scrolls V: Skyrim es un juego de rol de \n mundo lineal en el que los jugadores pueden explorar con \n restricciones con un vasto mundo de fantasía?", "Sonic es el personaje principal \n de la serie de videojuegos God of War?", "Call of Duty: Modern Warfare es un juego de \n disparos en primera persona lanzado en 2019?", "The Last of Us es un juego de acción y \n aventuras de terror de supervivencia en el \n que los jugadores deben sobrevivir a un mundo post-apocalíptico \n lleno de zombies?", "Super Smash Bros. es un juego de lucha \n en el que los personajes de diferentes \n franquicias de videojuegos se enfrentan entre sí?", "Shadow the Hedgehog fue creado originalmente \n por Sega en 1991?", "Overwatch es un juego de disparos en equipo \n en línea lanzado en 2016?", "Raiden es el personaje principal de la serie \n de videojuegos Metal Gear Solid?", "FIFA es una serie de juegos de simulación de \n fútbol que simulan partidos de fútbol realistas", "Resident Evil es una serie de videojuegos \n de terror de supervivencia en la que los jugadores \n deben luchar contra zombies?", "Red Dead Redemption es un juego de \n mundo abierto ambientado en el salvaje oeste, \n lanzado en 2010?"]
    var respuestas: [String] = ["Verdadero", "Verdadero", "Falso", "Falso", "Falso", "Falso", "Verdadero", "Falso", "Verdadero", "Verdadero", "Verdadero", "Falso", "Verdadero", "Verdadero", "Verdadero", "Falso", "Verdadero", "Verdadero", "Verdadero", "Verdadero", "Falso", "Verdadero", "Verdadero", "Verdadero", "Falso", "Verdadero", "Falso", "Verdadero", "Verdadero", "Verdadero"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        lblAciertos.isHidden = true
        lblRacha.isHidden = true
        btnVerdadero.isHidden = true
        btnFalso.isHidden = true
        if(nivel == "Principiante"){
            vidas = 3
            contadorCorrectas = 0
            limite = 7
            ganadas = 5
            
        }
        else if(nivel == "Intermedio"){
            vidas = 2
            contadorCorrectas = 0
            ganadas = 7
            limite = 19
        }
        else if(nivel == "Avanzado"){
            vidas = 1
            contadorCorrectas = 0
            ganadas = 10
            limite = 30
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcGanar" {
            let destinationVC = segue.destinationController as! vcGanar
            destinationVC.status = status
        }
    }
    
    @IBAction func inicio(_ sender: NSButton){
        btnInicio.isHidden = true
        lblAciertos.isHidden = false
        btnFalso.isHidden = false
        btnVerdadero.isHidden = false
        contadorPreguntas = Int.random(in: 0...i)
        lblPreguntas.stringValue = preguntas[contadorPreguntas]
        imgCorazones.image = NSImage(named: imgVidas[vidas])
        imgPistas.image = NSImage(named: imgPreguntas[contadorPreguntas])
        lblRacha.isHidden = false
        i -= 1
    }
    
    @IBAction func respuestas(_ sender: NSButton){
        if(contLimite <= limite){
                if(contadorCorrectas == ganadas){
                    status = "Ganaste \n Mejor racha: \(rachaGlobal) \n Jugadas: \(contadorIntentos) \n Score: \(contadorCorrectas)"
                    performSegue(withIdentifier: "vcGanar", sender: self)
                    self.view.window?.windowController?.close()
                }
                else{
                    if(respuestas[contadorPreguntas] == sender.title){
                        contLimite += 1
                        rachaGeneral += 1
                        contadorCorrectas += 1
                        lblAciertos.stringValue = "Score: \(contadorCorrectas)"
                        lblRacha.stringValue = "Racha: \(rachaGeneral)"
                        preguntas.remove(at: contadorPreguntas)
                        imgPreguntas.remove(at: contadorPreguntas)
                        respuestas.remove(at: contadorPreguntas)
                        contadorPreguntas = Int.random(in: 0...i)
                        lblPreguntas.stringValue = "\(preguntas[contadorPreguntas])"
                        imgPistas.image = NSImage(named: imgPreguntas[contadorPreguntas])
                        if(rachaGlobal < rachaGeneral){
                            rachaGlobal = rachaGeneral
                        }
                        i -= 1
                        contadorIntentos += 1
                    }
                    else {
                        vidas -= 1
                        contLimite += 1
                        preguntas.remove(at: contadorPreguntas)
                        imgPreguntas.remove(at: contadorPreguntas)
                        respuestas.remove(at: contadorPreguntas)
                        contadorPreguntas = Int.random(in: 0...i)
                        rachaGeneral = 0
                        lblPreguntas.stringValue = "\(preguntas[contadorPreguntas])"
                        imgCorazones.image = NSImage(named: imgVidas[vidas])
                        imgPistas.image = NSImage(named: imgPreguntas[contadorPreguntas])
                        lblRacha.stringValue = "Racha: \(rachaGeneral)"
                        i -= 1
                        contadorIntentos += 1
                        if(vidas == 0){
                            status = "Perdiste \n Mejor racha: \(rachaGlobal) \n Jugadas: \(contadorIntentos) \n Score: \(contadorCorrectas)"
                            performSegue(withIdentifier: "vcGanar", sender: self)
                            self.view.window?.windowController?.close()
                        }
                    }
                }
            

        }
    }
    
    @IBOutlet weak var btnVerdadero: NSButton!
    @IBOutlet weak var btnFalso: NSButton!
    @IBOutlet weak var btnInicio: NSButton!
    @IBOutlet weak var lblPreguntas: NSTextField!
    @IBOutlet weak var lblAciertos: NSTextField!
    @IBOutlet weak var imgPistas: NSImageCell!
    @IBOutlet weak var imgCorazones: NSImageCell!
    @IBOutlet weak var lblRacha: NSTextField!
}
