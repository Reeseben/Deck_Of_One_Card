//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Ben Erekson on 8/3/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import UIKit

class CardController {
    static var shared = CardController()
    
    var baseURL =  URL(string: "http://deckofcardsapi.com/api/deck/new/draw")
//    let cardComponent = "count=1"
    
    func fetchCard(completion: @escaping (Result <TopLevelObject, CardError>) -> Void) {
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL))}
//        let finalURL = baseURL.appendingPathComponent(cardComponent)
        let finalURL = baseURL
        
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
            if let error = error {
                print("Error reach out to the URL \(error)")
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("Response status code: \(response.statusCode)")
                }
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            
            let decoder = JSONDecoder()
            
            do{
                let topLevelObject = try decoder.decode(TopLevelObject.self, from: data)
                return completion(.success(topLevelObject))
            } catch {
                print("JSON Decodeing error")
                return completion(.failure(.thrownError(error)))
            }
            
        }.resume()
        
    }
    
    func fetchCardImage(for card: Card, completion: @escaping (Result<UIImage, CardError>) -> Void){
        
        // Prepare URL
         let url = card.image
        
        //Contact Server
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error retrieving url \(error)")
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("Response code: \(response.statusCode)")
                }
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            
            guard let image = UIImage(data: data) else { return completion(.failure(.couldNotDecode))}
            
            return completion(.success(image))
            
        }.resume()
        
    }
    
}//End Of Class
