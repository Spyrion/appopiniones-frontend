//
//  ListaTemasViewController.swift
//  App Opiniones
//
//  Created by user185160 on 4/19/21.
//

import UIKit

class ListaTemasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //creamos el Outlet de la tabla con la lista de temas
    @IBOutlet var table: UITableView!
    
    //creamos el Outlet de la barra de búsqueda para
    @IBOutlet var searchBar: UISearchBar!
    
    var temas = [Tema2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarTemas()
        table.delegate = self
        table.dataSource = self

    }
    
    //
    func configurarTemas() {
        temas.append(Tema2(titulo: "LOL",
                          descripcionBreve: "Fans del juego LOL",
                          descripcionCompleta: "...",
                          usuario: "FanLOL",
                          imagenTema: "LOL"))
        temas.append(Tema2(titulo: "Coches Eléctricos",
                          descripcionBreve: "Usuarios habituales de coches eléctricos",
                          descripcionCompleta: "...",
                          usuario: "greenPlanet",
                          imagenTema: "Coche"))
        temas.append(Tema2(titulo: "Smartphones",
                          descripcionBreve: "¿Cuáles son los mejores smartphones?",
                          descripcionCompleta: "...",
                          usuario: "programadorCEV",
                          imagenTema: "Smartphone"))
    }
    
    //numero de filas en las que habrá un tema en cada una de ellas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temas.count
    }
    
    //cada celda de las filas será un tema, para ello haremos un 'dequeue' del tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let tema = temas[indexPath.row]
        
        //configuramos los campos que apareceran de cada tema
        cell.textLabel?.text = tema.titulo
        cell.detailTextLabel?.text = tema.descripcionBreve
        cell.imageView?.image = UIImage(named: tema.imagenTema)
        cell.accessoryType = .disclosureIndicator
        
        //le damos formato a la celda de cada Tema
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 14)
        
        
        return cell
    }
    
    //función para determinar el tamaño de la celda que contiene el Tema
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //deseleccionaremos la celda
        tableView.deselectRow(at: indexPath, animated: true)
        
        //presentaremos el hilo de mensajes para el tema seleccionado
        let position = indexPath.row //posición de cada Tema en el tableView
        guard let vc = storyboard?.instantiateViewController(identifier: "hilo") as? SeleccionTemaViewController else {
            return
        }
        vc.temas = temas
        vc.position = position
        present(vc, animated: true)
    }

}

struct Tema2 {
    let titulo: String
    let descripcionBreve: String
    let descripcionCompleta: String
    let usuario: String
    let imagenTema: String
}

