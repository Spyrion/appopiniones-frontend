//
//  CrearTemaViewController.swift
//  App Opiniones
//
//  Created by user185160 on 4/19/21.
//

import UIKit

class CrearTemaViewController: UIViewController {

    // Outlets
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var categoriaTextField: UITextField!
    @IBOutlet weak var temaImageView: UIImageView!
    @IBOutlet weak var seleccionImagen: UIButton!
    @IBOutlet weak var crearTema: UIButton!
    
    // Objeto tema
    var tema: Tema?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Esconder teclado al presionar en cualquier lugar de la pantalla.
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
        
    // Ejecutar guardarTema cuando el btn de "crear tema" sea pulsado ya que tiene un segue asignado que nos llevará a la lista de temas de nuevo
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "guardarTema" {
            guardarTema()
        }
    }
        
    @IBAction func crearTema(_ sender: Any) {
        guardarTema()
    }
    func guardarTema() {
        // Comprobar que existan los varios datos introducidos y si están vacíos
        if let tituloTema = self.tituloTextField.text, !tituloTema.isEmpty,
           let descripcionTema = self.descripcionTextField.text, !descripcionTema.isEmpty,
           let categoriaTema = self.categoriaTextField.text, !categoriaTema.isEmpty {
            // Crear nuevo objeto tema y asignarle los datos introducidos en los text fields
            let newTema = Tema()
            newTema.title = tituloTema
            newTema.description = descripcionTema
            newTema.category = categoriaTema
            self.tema = newTema
        }
    }
}
