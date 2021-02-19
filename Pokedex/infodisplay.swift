//
//  infodisplay.swift
//  Pokedex
//
//  Created by ansh vidyabhanu on 24/12/20.
//

import UIKit

class infodisplay: UIViewController
{
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var idlabel: UILabel!
    @IBOutlet var typelabel1: UILabel!
    @IBOutlet var typelabel2: UILabel!
    
    var pokemon:Pbasic!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let url = URL(string: pokemon.url)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else{
                return
            }
            
            do{
                let PData = try JSONDecoder().decode( Pdata.self, from: data)
                DispatchQueue.main.async
                {
                self.namelabel.text = self.pokemon.name
                self.idlabel.text = String(format: "#%03d", PData.id)
                
                for i in PData.types
                {
                    print(i.slot)
                    if i.slot == 1
                    {
                        self.typelabel1.text = i.type.name
                    }
                    else if i.slot == 2 {
                        self.typelabel2.text = i.type.name
                    }
                }

                }
             
            }
            catch let error
            {
                print("\(error)")
            }
        }.resume()
    }
}
