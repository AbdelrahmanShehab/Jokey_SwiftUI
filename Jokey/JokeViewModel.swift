//
//  JokeViewModel.swift
//  Jokey
//
//  Created by Abdelrahman Shehab on 17/05/2023.
//

import Foundation
import Alamofire

class JokeViewModel: ObservableObject {
    
    @Published var jokes = [Value]()
    
    init() {
        getJokes()
    }
    
    func getJokes(count: Int = 6) {
        
        AF.request("http://api.icndb.com/jokes/random/\(count)", method: .get).responseDecodable(of: Welcome.self) { response in
            
            switch response.result {
            case .success(let data):
                _ = data.value
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
