//
//  MemesResult.swift
//  MemefulDemo
//
//  Created by SAURABH MISHRA on 18/04/20.
//  Copyright © 2020 SAURABH MISHRA. All rights reserved.
//



struct MemeResult: Decodable {
    
    let memes:[Meme]
    
    private enum CodingKeys : String, CodingKey {
        case memes = "data"
    }

}
