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
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var generateButton: UIButton! {
        didSet { generateButton.layer.cornerRadius = 20 }
    }
    @IBOutlet weak var backgroundImageView: UIImageView! 
    
    var gradientLayer: CAGradientLayer!
    let characterAttributeQuery = CharacterAttributesQuery()
    var isDataFetched: Bool = false
    var allCharacterClasses: [String] = []
    var allCharacterRaces: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabels()
        tryDataFetch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
    
    private func clearLabels() {
        classLabel.text = "\t"
        raceLabel.text = "\t"
        alignmentLabel.text = "\t"
    }
    
    private func populateLabels() {
        if isDataFetched == false {
            clearLabels()
        } else {
            classLabel.text = allCharacterClasses.randomElement()
            raceLabel.text = "Half-Orc"
            alignmentLabel.text = "Chaotic Neutral"
        }
    }
    
    private func tryDataFetch() {
        ApolloService.shared.client.fetch(query: characterAttributeQuery) { results, error in
            if error != nil {
                self.isDataFetched = false
                print("⛔️ Error in fetching response: \(String(describing: error))")
            } else {
                self.isDataFetched = true
                guard let classResults = results?.data?.classResult?.allClasses?.compactMap({ $0 }),
                      let raceResults = results?.data?.raceResult?.allRaces?.compactMap({ $0 })
                else { return }
                
                print(classResults)
                self.allCharacterClasses = classResults.map{ $0.name! }
                self.allCharacterRaces = raceResults.map{ $0.name! }
                print("⚔️ Classes: \(self.allCharacterClasses)")
                print("🧝🏾‍♀️ Races: \(self.allCharacterRaces)")
            }
        }
    }
    
    private func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = backgroundImageView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(named: "LightColor")!.cgColor]
        
        backgroundImageView.layer.addSublayer(gradientLayer)
        generateButton.layer.zPosition = 1
    }

    @IBAction func generateButtonTapped(_ sender: UIButton) {
        if isDataFetched == false {
            tryDataFetch()
            populateLabels()
        } else {
            populateLabels()
        }
    }
    
    

}

