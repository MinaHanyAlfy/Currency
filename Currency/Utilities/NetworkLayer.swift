//
//  NetworkLayer.swift
//  Currency
//
//  Created by Mina Hany on 5/18/21.
//

import Foundation
class NetworkLayer {
   static let shared = NetworkLayer()
    func getResults(description: String,pageNumber:Int, completed: @escaping (Result<[LebanonLera],ErorrMessage> ) -> Void) {
        let urlString : String = "https://win1withus.com/del/api/\(description.replacingOccurrences(of: " ", with:"_" ))-\(pageNumber)"
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ =  error {
                completed((.failure(.InvalidData)))
            }
            guard let data = data else {
                completed((.failure(.InvalidData)))
                return
            }
            guard let response =  response  as? HTTPURLResponse ,response.statusCode == 200 else{
                completed((.failure(.InvalidResponse)))
                return
            }
            do
            {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode([LebanonLera].self, from: data)
                completed((.success(results)))
                
            }catch {
                completed((.failure(.InvalidData)))
            }
            
        }
        task.resume()
    }
}
