//
//  PlaceModel.swift
//  MyFavoritePlace
//
//  Created by Nikolai Maksimov on 14.08.2022.
//

import RealmSwift
import Foundation

class Place: Object {
    
    @Persisted var name: String
    @Persisted var location: String?
    @Persisted var type: String?
    @Persisted var imageData: Data?
    @Persisted var date = Date()
    @Persisted var rating = 0.0

    convenience init(name: String, location: String?, type: String?, imageData: Data?, rating: Double) {
        self.init()
        self.name = name
        self.location = location
        self.type = type
        self.imageData = imageData
        self.rating = rating
    }
    
}
