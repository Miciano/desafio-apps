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
    
    let alamofireManager: Alamofire.SessionManager
    
    init() {
        //Configura o tempo de timeout do request
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
        
        //Configura os tipos de imagens que podem ser baixadas
        Alamofire.DataRequest.addAcceptableImageContentTypes(["image/jpg", "image/png", "image/jpeg"])
    }
    
    //Função faz request no JSON das noticias
    func getNotices(completion:@escaping (_ response: NoticeResponse)->Void) {
        
        alamofireManager.request(APIURLs.main, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let resultValue = value as? [[String: Any]]
                switch response.response?.statusCode ?? 0 {
                case 400...405:
                    let error = ServerError(msgError: "Erro 400", statusCode: response.response!.statusCode)
                    completion(.serverError(description: error))
                case 500:
                    let error = ServerError(msgError: "Bad Access", statusCode: 500)
                    completion(.serverError(description: error))
                case 301:
                    let error = ServerError(msgError: "Seu aplicativo está desatualizado, atualiza para poder usa-lo", statusCode: 301)
                    completion(.serverError(description: error))
                case 200:
                    let model = self.parserContent(response: resultValue)
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
                case -999:
                    completion(.cancelled)
                default:
                    completion(.invalidResponse)
                }
            }
        }
    }
    
    //Função faz o download das imagens pela url
    func getImage(url: String, completion:@escaping (_ response: ImageResponse)->Void) {
        let imgView = UIImageView()
        
        guard let url = URL(string: url) else { return }
        imgView.af_setImage(withURL: url, placeholderImage: nil, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.noTransition, runImageTransitionIfCached: true) { (response) in
            
            switch response.result {
            case .success(let value):
                completion(.success(model: value))
            case .failure(let error):
                switch error._code {
                case -999, 0:
                    let erro = ServerError(msgError: response.result.error.debugDescription, statusCode: error._code)
                    completion(.downloadCanceled(description: erro))
                default:
                    completion(.invalidResponse)
                }
            }
        }
    }
    
}
