//
//  DownloadJson.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 03/02/23.
//

import Foundation
import RxSwift

enum DownloadJsonError: Error{
    case FileNotFound
    case DecodeFailed
}

class DownloadJson{
    static let instance = DownloadJson()
    
    func downloadJson(fileName: String) -> Observable<[String]> {
        
        return Observable<[String]>.create { observer in
            
            if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([String].self, from: data)
                    
                    observer.onNext(jsonData)
                    observer.onCompleted()
                } catch {
                    observer.onError(DownloadJsonError.DecodeFailed)
                }
            }else{
                observer.onError(DownloadJsonError.FileNotFound)
            }
            return Disposables.create()
        }
        
    }
    
//    func downloadJson(fileName: String, completion: @escaping (_ resultModel: Result<[String], Error>) -> ()) {
//        
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode([String].self, from: data)
//                
//                completion(.success(jsonData))
//            } catch {
//                completion(.failure(DownloadJsonError.DecodeFailed))
//            }
//        }else{
//            completion(.failure(DownloadJsonError.FileNotFound))
//        }
//    }
}
