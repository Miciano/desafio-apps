//
//  Info_GloboTests.swift
//  Info GloboTests
//
//  Created by Fabio Miciano on 16/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import XCTest

@testable import Info_Globo

class Info_GloboTests: XCTestCase, MainParse {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //CARREGO E TESTO O JSON CORRETO
        let jsonCorrect = loadJsonCorrect()
        XCTAssertNotNil(jsonCorrect, "Falha no load do arquivo local do JSON correto")
        let contentCorrect = parserContent(response: jsonCorrect)
        XCTAssertNotNil(contentCorrect, "Parse do JSON correto falhou")
        //SE ESPERA QUE RETORNE UM ARRAY DE CONTEUDO COM PELOMENOS 1 ELEMENTO
        XCTAssert(contentCorrect!.count > 0 ? true : false, "Retornou um modelo vazio ou inválido mesmo com o json correto")
        
        //CARREGO E TESTO O JSON VAZIO
        let jsonEmpty = loadJsonEmpty()
        XCTAssertNotNil(jsonEmpty, "Falha no load do arquivo local do JSON vazio")
        let contentEmpty = parserContent(response: jsonEmpty)
        XCTAssertNotNil(contentEmpty, "Parse do JSON vazio falhou")
        //SE ESPERA QUE RETORNE UM ARRAY DE CONTEUDO VAZIO
        XCTAssert(contentEmpty!.count == 0 ? true : false, "Retornou um modelo válido mesmo JSON estando vazio")
        
        //CARREGO E TESTO O JSON QUEBRADO
        let jsonBroken = loadJsonBroken()
        XCTAssertNotNil(jsonBroken, "Falha no load do arquivo local do JSON Errado")
        let contentBroken = parserContent(response: jsonBroken)
        XCTAssertNotNil(contentBroken, "Parse do JSON errado falhou")
        //SE ESPERA QUE RETORNE UM ARRAY DE CONTEUDO VAZIO
        XCTAssert(contentBroken!.count == 0 ? true : false, "Retornou um modelo válido mesmo JSON estando errado")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //PRAGMA MARK: -- LOADS DE JSONS --
    //Json correto
    private func loadJsonCorrect()-> [[String: Any]]? {
        do {
            //Carrego o bundle de teste
            let bundle = Bundle(for: Info_GloboTests.self)
            guard let file = bundle.url(forResource: "noticesCorrect", withExtension: "json") else { return nil }
            let data = try Data(contentsOf: file)
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else { return nil }
            
            return json
        }
        catch {
            return nil
        }
    }
    
    //Json vazio
    private func loadJsonEmpty()-> [[String: Any]]? {
        do {
            //Carrego o bundle de teste
            let bundle = Bundle(for: Info_GloboTests.self)
            guard let file = bundle.url(forResource: "noticesEmpty", withExtension: "json") else { return nil }
            let data = try Data(contentsOf: file)
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else { return nil }
            
            return json
        }
        catch {
            return nil
        }
    }
    
    //Json quebrado
    private func loadJsonBroken()-> [[String: Any]]? {
        do {
            //Carrego o bundle de teste
            let bundle = Bundle(for: Info_GloboTests.self)
            guard let file = bundle.url(forResource: "noticesBroken", withExtension: "json") else { return nil }
            let data = try Data(contentsOf: file)
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else { return nil }
            
            return json
        }
        catch {
            return nil
        }
    }
}
