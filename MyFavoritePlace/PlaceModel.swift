//
//  PlaceModel.swift
//  MyFavoritePlace
//
//  Created by Nikolai Maksimov on 14.08.2022.
//

import Foundation
import UIKit

struct Place {
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage? // временное решение
    var restaurantImage: String?
    
    // временно
    static let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории", "Классик",
        "Love&Life", "Шок", "Бочка"
    ]
    // временно
    static func getPlaces() -> [Place] {
        var places:[Place] = []
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Kerch", type: "Restaurant",image: nil, restaurantImage: place))
        }
        
        return places
    }
    
}
