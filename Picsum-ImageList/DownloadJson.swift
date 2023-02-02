//
//  DownloadJson.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 03/02/23.
//

import Foundation

enum DownloadJsonError: Error{
    case FileNotFound
    case DecodeFailed
}

class DownloadJson{
    static let instance = DownloadJson()
    
    func downloadJson(fileName: String, completion: @escaping (_ resultModel: Result<[String], Error>) -> ()) {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([String].self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(DownloadJsonError.DecodeFailed))
            }
        }
        
        completion(.failure(DownloadJsonError.FileNotFound))
    }
}
