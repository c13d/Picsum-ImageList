//
//  DownloadImage.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import Foundation
import Alamofire

class DownloadImage{
    static let instance = DownloadImage()
    let getImageURL = "https://picsum.photos/v2/list?page="
    let limit = 10
    
    func downloadImageList(page: Int, completion: @escaping (_ resultModel: [ImageModel]) -> ()) {
        AF.request(getImageURL + "\(page)" + "&limit=\(limit)").response  { response in
            switch response.result {
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode([ImageModel].self, from: data!)
                    completion(jsonData)
                }catch{
                    
                }
            case . failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
