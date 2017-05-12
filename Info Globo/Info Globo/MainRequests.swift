//
//  MainRequests.swift
//  Info Globo
//
//  Created by Fabio Miciano on 12/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

struct MainRequests: MainParse {
    
    var alamofireManager: Alamofire.SessionManager?
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func getNotices(completion:@escaping (_ response: NoticeResponse)->Void) {
        
        alamofireManager?.request(APIURLs.main, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let resultValue = value as? [String: Any]
                switch response.response?.statusCode ?? 0 {
                case 400...405:
                    if let detail = resultValue?.detailKey {
                        let error = ServerError(msgError: detail, statusCode: response.response!.statusCode)
                        completion(.serverError(description: error))
                    }
                case 500:
                    let error = ServerError(msgError: "Bad Access", statusCode: 500)
                    completion(.serverError(description: error))
                case 301:
                    let error = ServerError(msgError: "Seu aplicativo está desatualizado, atualiza para poder usa-lo", statusCode: 301)
                    completion(.serverError(description: error))
                case 200:
                    let model = self.parserNotice(response: resultValue)
                    completion(.success(model: model))
                default:
                    completion(.invalidResponse)
                }
            case .failure(let error):
                switch error._code {
                case -1009:
                    let erro = ServerError(msgError: "Sem conexão com a internet no momento", statusCode: -1009)
                    completion(.noConnection(description: erro))
                case -1001:
                    let erro = ServerError(msgError: "Tempo de requisição execido, tente novamente", statusCode: -1001)
                    completion(.timeOut(description: erro))
                default:
                    completion(.invalidResponse)
                }
            }
        }
    }
    
    func getImage() {
        
    }
    
}
