//
//  CetacAppTests.swift
//  CetacAppTests
//
//  Created by user192340 on 10/10/21.
//

import XCTest

@testable import CetacApp

class CetacAppTests: XCTestCase {
    
    let model = ViewModel()
    let model2 = DetailedSessionView()
    let model3 = LoginView()
    
    override func setUp() {    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUsers() throws {
        let parameters: [String: Any] = ["token": "aa1b6b26d690368d6f74a35a7daa0916"]
        let pkg: () = model.fetchUsers(parameters: parameters)
        XCTAssertNotNil(pkg)
    }
    
    func testCreateUser() throws {
        let pkg: () = model.createUser(parameters: ["nombre": "prueba 2", "fechaDeNacimiento": "20-01-2001", "sexo": "M", "ocupacion": "Estudiante", "religion": "N/A", "procedencia": "Mexicano", "calle": "6630", "interior": "N/A", "colonia": "N/A", "alcaldia": "N/A", "cp": "N/A", "telefono": "N/A", "movil": "N/A", "motivo": "Mejora", "identificacionRespuesta": "N/A", "ekr": "ekr"])
        XCTAssertNotNil(pkg)
    }
    
            
    func testDeleteUser() throws {
        let pkg: () = model.deleteUser(parameters: ["id": 0])
        XCTAssertNotNil(pkg)
        
    }
    
    func testSessionView() throws {
        let pkg: () = model2.getData()
        XCTAssertNotNil(pkg)
        
    }
    
    /*func testLogin() throws {
        let pkg = model3.login(email: "admin")
        XCTAssertTrue(pkg)
    }
    
    func testLoginFail() throws {
        let pkg = model3.login(email: "user123")
        XCTAssertFalse(pkg)
    }*/
    
}
