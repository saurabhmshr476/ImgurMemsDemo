//
//  Service.swift
//  MemefulDemo
//
//  Created by SAURABH MISHRA on 17/04/20.
//  Copyright © 2020 SAURABH MISHRA. All rights reserved.
//

import Foundation

//MARK: - Netwrok constants

enum NetworkConfig {
    static let baseURL = "https://api.imgur.com/3/gallery/"
    static let clientId = "8c2c5ea6cd491e8"
}



//MARK: - Netwrok Service class

class Service{
    
    static let shared = Service()

    let windowTerm = "day" // day , week , month , year , all
    let section = "hot" // hot , top , user
    let page = 1

    func imgurMemes(viral:Bool, completionHandler: @escaping (MemeResult?,Error?)->()) {

        let sort = viral ? "viral" : "time"
    
        let urlStr = NetworkConfig.baseURL + "\(section)/\(sort)/\(windowTerm)/\(page)"

        guard let url = URL(string: urlStr) else {return}
    
        var urlRequest:URLRequest = URLRequest(url: url)
        
        // http method
        urlRequest.httpMethod = "GET"
        // for http auth
        urlRequest.setValue("Client-ID \(NetworkConfig.clientId)", forHTTPHeaderField: "Authorization")
        // for content type
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        URLSession.shared.dataTask(with: urlRequest) { (data, resp, err) in
            
            if let err = err{
                completionHandler(nil,err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let memes = try decoder.decode(MemeResult.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(memes,nil)
                }
            } catch _{
                print("Error in decoding")
            }
            
            
        }.resume()
        
        
    }
    
    
}





