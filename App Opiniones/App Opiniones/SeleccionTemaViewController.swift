//
//  SeleccionTemaViewController.swift
//  App Opiniones
//
//  Created by user185160 on 4/19/21.
//

import UIKit

class SeleccionTemaViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    public var position: Int = 0

    public var temas = [Tema]()
    public var connection = Connection()
    public var tema : Tema?
    public var userlogin: User?
    public var vcLogin = LoginViewController()

    //este holder se ocupará de que los elementos de la vista estén contenidos en la misma siempre para diferentes dispositivos
    @IBOutlet var holder: UIView!
    @IBOutlet weak var tableViewMessages: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var imageTema: UIImageView!
    @IBOutlet weak var viewMessage: UIView!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var messagetextLabel: UITextView!
    //para mostrar la 'descripcionBreve' del Tema dentro del hilo de mensajes
    @IBOutlet weak var messagesLabel: UILabel!
    private let descriptionTextView: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 //para el wrap de lineas
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMessages.delegate = self
        tableViewMessages.dataSource = self

        //imageTema.image = UIImage(named: temas[position].imagenTema)
        //titleLabel.text = temas[position].titulo
        //descriptionLabel.text = temas[position].descripcionBreve
        if let tema = tema {
            self.imageTema.image = UIImage(named: tema.photo!)
            self.titleLabel.text = tema.title
            self.descriptionLabel.text = tema.description
            self.membersLabel.text = "Miembros: "+String((tema.usuario.count))
            self.messagesLabel.text = "Respuestas: "+String(tema.mensaje.count)
        }
        connection.getDataAjustes(withId: vcLogin.id ?? 0){ user in
            
            self.userlogin = user
        }

        buttonFavorite.layer.cornerRadius = 15
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tema?.mensaje.count)!
    }
    
    //cada celda de las filas será un tema, para ello haremos un 'dequeue' del tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCelda", for: indexPath) as! MessageTableViewCell
        
        //configuramos los campos que apareceran de cada tema
        if let mensaje = tema?.mensaje[indexPath.row]{
            cell.messageUser.text = mensaje.body
        }
        if let user = tema?.usuario[indexPath.row]{
            cell.imageUser.image = UIImage(named: user.photo!)
        }
        let listamensajes = userlogin?.mensaje
        
        for i in listamensajes! {
            if i?.body == tema?.mensaje[indexPath.row]?.body{
                cell.buttonDeleteMessage.isHidden = false
                cell.buttonEditMessage.isHidden = false
            }
            
        }
        
        return cell
    }
    
    //función para determinar el tamaño de la celda que contiene el Tema
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    //hacemos un override de esta función para que se muestren los elementos de la función 'configurePosts()' a través del 'holder' creado
    /*override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configurePosts()
        }
    }
    
    func configurePosts() {
        //introduzco a modo ejemplo la descripción breve del Tema ya en la pantalla de detalle de Tema
        let tema = temas[position] //para cada tema en su respectiva posición, mostraremos la siguiente información cuando abramos el hilo de mensajes
        descriptionTextView.frame = CGRect(x: 10,
                                           y: 10,
                                           width: holder.frame.size.width-20,
                                           height: holder.frame.size.width-20)
        descriptionTextView.text = tema.description
        holder.addSubview(descriptionTextView)
    }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueUser" {
            if let indexPath = self.tableViewMessages.indexPathForSelectedRow {
                let user = self.tema?.usuario[indexPath.row]
                let userdetailViewController = segue.destination as! UserDetailViewController
                userdetailViewController.user = user
            }
        }
    }
    
    @IBAction func SendMessage(_ sender: Any) {
        
        viewMessage.isHidden = false
        
    }
    
    @IBAction func sendViewMessage(_ sender: Any) {
        let baseURLMensaje = "localhost:8080/api/mensajes/"
        if let body = messagetextLabel.text, !body.isEmpty {
            let jsonObject = """

                            {
                            "body" = \(body) ,
                            "usuario" = \(String(describing: userlogin)) ,
                            "tema" = "\(String(describing: tema))"
                            }

                            """
          
            // funcion POST enviar un mensaje
            
            func postMensaje( params: [AnyHashable: Any], completion: @escaping (_ mensaje: Mensaje?) -> Void ) {
                guard let urlDataAjustes = URL(string: baseURLMensaje) else {
                   completion(nil)
                   return
                   
               }
                var requestPOST = URLRequest(url: urlDataAjustes , cachePolicy: .useProtocolCachePolicy , timeoutInterval:  10 )
                             requestPOST.httpMethod = "POST"
                             requestPOST.addValue("application/json", forHTTPHeaderField: "content-type")
                             requestPOST.httpBody = try? JSONEncoder().encode(jsonObject)
                }
        }
        viewMessage.isHidden = true
    }
    @IBAction func cancelViewMessage(_ sender: Any) {
        viewMessage.isHidden = true
    }
    @IBAction func deleteMessage(_ sender: Any) {
    }
    @IBAction func editMessage(_ sender: Any) {
    }
}



