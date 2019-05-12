//
//  ViewController.swift
//  DnDCharacterGenerator
//
//  Created by Britney Smith on 5/11/19.
//  Copyright © 2019 Britney Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let characterClassQuery = CharacterClassQuery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApolloService.shared.client.fetch(query: characterClassQuery) { results, error in
            if let results = results?.data?.result?.jsonObject {
                print(results)
            }
        }
    }


}

