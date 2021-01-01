//
//  NetworkService.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import Foundation
import Alamofire

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    // MARK: - Create
    
    // MARK: - Read
    
    func getOverviewStatistics(completion: @escaping ((DataResponse<StatisticsResponse, AFError>) -> Void)) {
        AF.request(API_URLs.getOverviewStatistics).responseDecodable(of: StatisticsResponse.self, completionHandler: completion)
    }
    
    // MARK: - Update
    
    // MARK: - Delete
}

extension NetworkService {
    
    private struct API_URLs {
        static let getOverviewStatistics = "http://api.covid19api.com/summary"
    }
    
}
