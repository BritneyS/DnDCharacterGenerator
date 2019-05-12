//
//  ViewController.swift
//  DnDCharacterGenerator
//
//  Created by Britney Smith on 5/11/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

/*
 
 Characters:
 - Class
 - Race
 - Alignment
 - Starting Equipment?
 - Ability Scores?
 - Hit Die?
 
*/
import UIKit

class ViewController: UIViewController {
    
    let characterClassQuery = CharacterClassQuery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApolloService.shared.client.fetch(query: characterClassQuery) { results, error in
            if error != nil {
                print("⛔️ Error in fetching response: \(String(describing: error))")
            } else if let results = results?.data?.result?.results?.compactMap({ $0 }) {
                print(results)
                let allCharacterClasses = results.map{ $0.name! }
                print("⚔️ Classes: \(allCharacterClasses)")
            }
        }
    }

    
    

}

