//
//  Meme.swift
//  MemefulDemo
//
//  Created by SAURABH MISHRA on 18/04/20.
//  Copyright © 2020 SAURABH MISHRA. All rights reserved.
//



struct Meme: Decodable {
    let title: String?
    let points:Int?
    let images:[MemeImage]?
    
}
