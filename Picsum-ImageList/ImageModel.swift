//
//  ImageModel.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import Foundation

struct ImageModel: Decodable{
    let id: String
    let author: String
    let download_url: String
}
