//
//  ApiManager.swift
//  pokeapi
//
//  Created by User-R05 on 1/29/23.
//

import Foundation
import UIKit.UIImage
import Alamofire

enum Failure: Error {
    case urlConstructError
    case statusCode
}

final class ApiManager {
    static func fetchImage(imageUrl: String) async throws -> UIImage {
        guard let url = URL(string: imageUrl) else {
            throw Failure.urlConstructError
        }
        
        var image: UIImage?
        
        AF.request(url, method: .get).response { response in
            switch response.result {
            case .success(let _image):
                image = UIImage(data: _image!)
            case .failure(let error):
                print("\(error)")
            }
        }
        
        return image!
    }
}
