//
//  CovidService.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import Foundation
import Alamofire

struct CovidService {

    static let shared = CovidService()

    private init() { }

    func getSummaryStatistics(completion: @escaping ((DataResponse<StatisticsResponse, AFError>) -> Void)) {
        AF.request(Endpoint.summary)
          .responseDecodable(of: StatisticsResponse.self, completionHandler: completion)
    }
}

// MARK: - Covid data endpoints
extension CovidService {
    private struct Endpoint {
        static let summary = "http://api.covid19api.com/summary"
    }
}
