//
//  KVNetworking.swift
//  KVProj
//
//  Created by Matías Spinelli on 01/06/2021.
//

import UIKit
import Alamofire

typealias APIFailureHandler = (Error) -> Void
typealias APICompletionHandler = (Any) -> Void

final class KVNetworking {

    static let sharedInstance: KVNetworking = KVNetworking()
    
    private init() { }
    
    private static let GnomesUrl: String = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
    
    func getGnomes(_ completionHandler : @escaping APICompletionHandler, failureHandler : @escaping APIFailureHandler) {
        
        AF.request(KVNetworking.GnomesUrl, parameters: nil, encoding: URLEncoding.default).responseJSON { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let gnomesResponse = try decoder.decode(KVGnomes.self, from: data)
                completionHandler(gnomesResponse)
                
            } catch let error {
                failureHandler(error as Error)
            }
        }
    }
}
