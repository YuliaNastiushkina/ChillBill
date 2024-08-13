import XCTest
import RealmSwift

final class RealmManagerTests: XCTestCase {
    
    var realmManager: RealmManager!
    
    /// Initialize the RealmManager for each test.
    override func setUpWithError() throws {
        super.setUp()
        realmManager = RealmManager.shared
    }
    
    override func tearDownWithError() throws {
        realmManager = nil
        super.tearDown()
    }
    
    func testSingletonInstanceExist() throws {
        XCTAssertNotNil(realmManager)
    }
    
    func testMultipleCallsReturnsTheSameSingletonInstance() throws {
        let secondInstance = RealmManager.shared
        XCTAssertTrue(realmManager === secondInstance)
    }
    
    func testRealmInitialization() throws {
        XCTAssertNoThrow(try Realm())
    }
}
