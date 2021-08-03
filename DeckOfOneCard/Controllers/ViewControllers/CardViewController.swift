//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Ben Erekson on 8/3/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var suitLable: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        suitLable.text = ""
    }
    //MARK: - Properties
    
    
    //MARK: - Actions
    @IBAction func drawButtonPressed(_ sender: Any) {
        
        CardController.shared.fetchCard { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let TopLevelObject):
                    self?.updateViews(with: TopLevelObject.cards[0])
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
        
    }
    
    func updateViews(with card: Card){
        
        CardController.shared.fetchCardImage(for: card) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.suitLable.text = "\(card.value) of \(card.suit)"
                    self?.cardImage.image = image
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
        
    }
    

}
