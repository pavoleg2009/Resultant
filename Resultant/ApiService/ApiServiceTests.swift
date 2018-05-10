import XCTest
@testable import Resultant

class ApiServiceTests: XCTestCase {
    
    var sutApiService: ApiServiceImpl!
    
    override func setUp() {
        super.setUp()
        sutApiService = ApiServiceImpl()
    }
    
    override func tearDown() {
        sutApiService = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
