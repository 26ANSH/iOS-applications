//
//  ViewController.swift
//  Pokedex
//
//  Created by ansh vidyabhanu on 24/12/20.
//

import UIKit

class ViewController: UITableViewController {
    var pokemon: [Pbasic] = []
    
    func cap(text: String) -> String {
        return text.prefix(1).uppercased() + text.dropFirst()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad()
    {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=200")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else{
                return
            }
            
            do{
                let plist = try JSONDecoder().decode( Plist.self, from: data)
                self.pokemon = plist.results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
             
            }
            catch let error
            {
                print("\(error)")
            }
        }.resume()
    }
    // number of rows according to my data
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    // Display stuff i need
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath)
        cell.textLabel?.text = cap(text: pokemon[indexPath.row].name)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "pokemoninfo" {
            if let destination = segue.destination as? infodisplay {
                destination.pokemon = pokemon[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}

