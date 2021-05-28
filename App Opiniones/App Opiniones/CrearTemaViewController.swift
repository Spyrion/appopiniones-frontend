//
//  CrearTemaViewController.swift
//  App Opiniones
//
//  Created by user185160 on 4/19/21.
//

import UIKit

class CrearTemaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound , .badge]) { (granted , error) in
            if granted {
                print("nos han dado permiso")
            } else {
                print("no nos han dado permiso")
                print(error)
            }
        }

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
        let baseURLTema = "localhost:8080/api/temas/"
        // Comprobar que existan los varios datos introducidos y si están vacíos
        if let title = self.tituloTextField.text, !title.isEmpty,
           let description = self.descripcionTextField.text, !description.isEmpty,
           let category = self.categoriaTextField.text, !category.isEmpty,
           let photo = self.temaImageView.image {
            let jsonObject = """

                                    {
                                    "title" = "\(title)" ,
                                    "description" = "\(description)" ,
                                    "category" = "\(category)" ,
                                    "photo" = "\(photo)" ,
                                    "usuario" = "username" ,
                                    "mensajes" = null
                                    }

                                    """
                  
    // Funcion POST del objeto JSON a la URL
    func postTema( params: [AnyHashable: Any], completion: @escaping (_ tema: Tema?) -> Void ) {
                            guard let urlDataAjustes = URL(string: baseURLTema) else {
                                completion(nil)
                               return
                               
                           }
                            var requestPOST = URLRequest(url: urlDataAjustes , cachePolicy: .useProtocolCachePolicy , timeoutInterval:  10 )
                                         requestPOST.httpMethod = "POST"
                                         requestPOST.addValue("application/json", forHTTPHeaderField: "content-type")
                                         requestPOST.httpBody = try? JSONEncoder().encode(jsonObject)
                            }
          
            
            let content = UNMutableNotificationContent()
            content.title = "AppOpiniones"
            content.body = "¡Se ha creado el tema con exito!"
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            let request = UNNotificationRequest(identifier: "tema creado" , content : content , trigger: trigger )
            UNUserNotificationCenter.current().add(request) {(error) in
                print (error)
            }
        }
    }
    // Acción de selección de imagen
    @IBAction func seleccionImagen(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    // Función de representación de imagen seleccionada
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        temaImageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
}
