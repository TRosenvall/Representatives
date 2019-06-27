//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Timothy Rosenvall on 6/27/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping([Representative]) -> Void) {
        guard let url = baseURL else {completion([]); return}
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let searchTerm = URLQueryItem(name: "state", value: state)
        let forceJSON = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [searchTerm, forceJSON]
        guard let finalURL = components?.url else {completion([]); return}
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion([]); return
            } else if let data = data {
                guard let newData = String(data: data, encoding: .ascii)?.data(using: .utf8) else {completion([]); return}
                do{
                    let decoder = JSONDecoder()
                    let topLevelJSON = try decoder.decode(TopLevelJSON.self, from: newData)
                    completion(topLevelJSON.results); return
                } catch {
                    print(error.localizedDescription)
                    completion([]); return
                }
            }
        }.resume()
    }
}
