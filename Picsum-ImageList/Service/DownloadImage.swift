//
//  DownloadImage.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

enum NetworkError: Error{
    case NetworkFailed
    case DecodeFailed
}

class DownloadImage{
    static let instance = DownloadImage()
    let getImageURL = "https://picsum.photos/v2/list?page="
    let limit = 15
        
    func downloadImageList(page: Int) -> Observable<[ImageModel]> {
        return Observable<[ImageModel]>.create { observer in
            let url = self.getImageURL + "\(page)" + "&limit=\(self.limit)"
            let request = AF.request(url).response  { response in
                switch response.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode([ImageModel].self, from: data!)
                        observer.onNext(jsonData)
                        observer.onCompleted()
                    }catch{
                        observer.onError(NetworkError.DecodeFailed)
                    }
                case . failure(_):
                    observer.onError(NetworkError.NetworkFailed)
                }
            }
            return Disposables.create{
                request.cancel()
            }
        }
    }
    
    
//    func downloadImageList(page: Int, completion: @escaping (_ resultModel: Result<[ImageModel], Error>) -> ()) {
//        print(getImageURL + "\(page)" + "&limit=\(limit)")
//        AF.request(getImageURL + "\(page)" + "&limit=\(limit)").response  { response in
//            switch response.result {
//            case .success(let data):
//                do{
//                    let jsonData = try JSONDecoder().decode([ImageModel].self, from: data!)
//                    completion(.success(jsonData))
//                }catch{
//                    completion(.failure(NetworkError.DecodeFailed))
//                }
//            case . failure(_):
//                completion(.failure(NetworkError.NetworkFailed))
//            }
//        }
//    }
}

