//
//  DownloadImage.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import Foundation
import Alamofire

enum NetworkError: Error{
    case NetworkFailed
    case DecodeFailed
}

class DownloadImage{
    static let instance = DownloadImage()
    let getImageURL = "https://picsum.photos/v2/list?page="
    let limit = 15
    
    func downloadImageList(page: Int, completion: @escaping (_ resultModel: Result<[ImageModel], Error>) -> ()) {
        print(getImageURL + "\(page)" + "&limit=\(limit)")
        AF.request(getImageURL + "\(page)" + "&limit=\(limit)").response  { response in
            switch response.result {
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode([ImageModel].self, from: data!)
                    completion(.success(jsonData))
                }catch{
                    completion(.failure(NetworkError.DecodeFailed))
                }
            case . failure(_):
                completion(.failure(NetworkError.NetworkFailed))
            }
        }
    }
}

