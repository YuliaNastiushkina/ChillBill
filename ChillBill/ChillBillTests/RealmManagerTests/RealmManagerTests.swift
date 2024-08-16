import XCTest
import RealmSwift

final class RealmManagerTests: XCTestCase {
    
    var realmManager: RealmManager!
    
    override func setUpWithError() throws {
        let config = Realm.Configuration(inMemoryIdentifier: "TestRealm")
        realmManager = try RealmManager(configuration: config)
    }
    
    override func tearDownWithError() throws {
        if let realm = realmManager.realm, realm.isInWriteTransaction {
            realm.cancelWrite()
        }
        realmManager = nil
    }
    
    func testRealmInitialization() throws {
        XCTAssertNotNil(realmManager.realm)
    }
    
    func testRealmInitializerThrowsTheErrorWhenInitializationFailsWithInvalidConfiguration() throws {
        let invalidConfiguration = Realm.Configuration(fileURL: URL(fileURLWithPath: "/dev/null"))
        
        XCTAssertThrowsError(try RealmManager(configuration: invalidConfiguration)) { error in
            XCTAssertTrue(error is RealmError)
            if case RealmError.initializationFailed(let reason) = error {
                XCTAssertTrue(reason.contains("Operation not permitted"), "Unexpected error reason: \(reason)")
            } else {
                XCTFail("Unexpected error type: \(error)")
            }
        }
    }
    
    func testFunctionAddObjectSavedObjectToTheStorage() throws {
        let testObject = TestObject(id: "1", name: "Test")
        
        try realmManager.addObject(testObject)
        
        let fetchedObject = realmManager.realm?.object(ofType: TestObject.self, forPrimaryKey: "1")
        XCTAssertNotNil(fetchedObject)
        XCTAssertEqual(fetchedObject?.name, "Test")
    }
    
    func testfetchObjectsReturnsEmptyArrayWhenWhenNoObjectsExist() throws {
        let fetchedObjects = try realmManager.fetchObjects(ofType: TestObject.self)
        
        XCTAssertTrue(fetchedObjects.isEmpty)
    }
    
    func testfetchObjectsSuccessfullyFetchesObjectsFromTheDataBase() throws {
        let testObject = TestObject(id: "1", name: "Test")
        let secondTestObject = TestObject(id: "2", name: "Test2")
        
        try realmManager.addObject(testObject)
        try realmManager.addObject(secondTestObject)
        
        let fetchedObjects = try realmManager.fetchObjects(ofType: TestObject.self)
        XCTAssertEqual(fetchedObjects.count, 2)
    }
    
    func testDeleteObjectSuccessfullyRemovesObjectFromDatabase() throws {
        let testObject = TestObject(id: "1", name: "Test")
        
        try realmManager.addObject(testObject)
        try realmManager.deleteObject(testObject)
        
        let fetchedObjects = try realmManager.fetchObjects(ofType: TestObject.self)
        XCTAssertTrue(fetchedObjects.isEmpty)
    }
    
    func testDeleteObjectThrowsErrorIfObjectIsInvalidated() throws {
        let testObject = TestObject(id: "1", name: "Test")
        try realmManager.addObject(testObject)
        
        try realmManager.deleteObject(testObject)
        XCTAssertThrowsError(try realmManager.deleteObject(testObject)) { error in
            XCTAssertTrue(error is RealmDeletionError)
            if case RealmDeletionError.objectInvalidated = error {
                XCTAssertTrue(true)
            } else {
                XCTFail("Unexpected error type: \(error)")
            }
        }
    }
}
