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
    
    @IBOutlet weak var classLabel: UILabel!
    
    let characterClassQuery = CharacterClassQuery()
    var allCharacterClasses: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classLabel.text = "\t"
        ApolloService.shared.client.fetch(query: characterClassQuery) { results, error in
            if error != nil {
                print("⛔️ Error in fetching response: \(String(describing: error))")
            } else if let results = results?.data?.classResult?.allClasses?.compactMap({ $0 }) {
                print(results)
                self.allCharacterClasses = results.map{ $0.name! }
                print("⚔️ Classes: \(self.allCharacterClasses)")
            }
        }
    }

    @IBAction func generateButtonTapped(_ sender: UIButton) {
        classLabel.text = allCharacterClasses.randomElement()
    }
    
    

}

