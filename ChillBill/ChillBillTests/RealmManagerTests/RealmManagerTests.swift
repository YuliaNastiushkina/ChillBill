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
    
    func testRealmInitializationFailsWithInvalidConfiguration() throws {
        let invalidConfiguration = Realm.Configuration(fileURL: URL(fileURLWithPath: "/dev/null"))
        
        do {
            _ = try Realm(configuration: invalidConfiguration)
            XCTFail()
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func testFunctionAddObjectSavedObjectToTheStorage() throws {
        let testObject = TestObject(id: "1", name: "Test")
        
        try realmManager.addObject(testObject)
        
        let fetchedObject = realmManager.realm?.object(ofType: TestObject.self, forPrimaryKey: "1")
        XCTAssertNotNil(fetchedObject)
        XCTAssertEqual(fetchedObject?.name, "Test")
    }
    
    func testAddObjectDoesNotAddObjectIfRealmInitializedWithInvalidConfiguration() throws {
        let invalidConfiguration = Realm.Configuration(fileURL: URL(fileURLWithPath: "/dev/null"))
        let faultyRealmManager = try RealmManager(configuration: invalidConfiguration)
        
        let testObject = TestObject(id: "1", name: "Test")
        
        try faultyRealmManager.addObject(testObject)
        
        XCTAssertNil(faultyRealmManager.realm?.object(ofType: TestObject.self, forPrimaryKey: "1"))
    }
    
    func testfetchObjectsReturnsEmptyArrayWhenRealmInitializationFails() throws {
        let invalidConfiguration = Realm.Configuration(fileURL: URL(fileURLWithPath: "/dev/null"))
        let faultyRealmManager = try RealmManager(configuration: invalidConfiguration)
        
        let testObject = TestObject(id: "1", name: "Test")
        
        try faultyRealmManager.addObject(testObject)
        let fetchedObjects = try faultyRealmManager.fetchObjects(ofType: TestObject.self)
        XCTAssertEqual(fetchedObjects, [])
    }
    
    func testfetchObjectsReturnsEmptyArrayWhenTheDatabaseIsEmpty() throws {
        let fetchedObjects = try realmManager.fetchObjects(ofType: TestObject.self)
        
        XCTAssertEqual(fetchedObjects, [])
    }
    
    func testfetchObjectsReturnsAllObjectsFromTheDataBase() throws {
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
        XCTAssertEqual(fetchedObjects.count, 0)
    }
    
    func testDeleteObjectDoesNotCauseIssuesWhenTryingToDeleteNonExistentObject() throws {
        let testObject = TestObject(id: "1", name: "Test")
        try realmManager.addObject(testObject)
        
        let fetchedObject = try realmManager.fetchObjects(ofType: TestObject.self).first
        
        if let fetchedObject = fetchedObject {
            try realmManager.deleteObject(fetchedObject)
        }
        try realmManager.deleteObject(testObject)
        
        let remainingObjects = try realmManager.fetchObjects(ofType: TestObject.self)
        XCTAssertEqual(remainingObjects.count, 0)
    }
    
    func testDeleteObjectDoesNotCauseIssuesWhenRealmInitializationFails() throws {
        let invalidConfiguration = Realm.Configuration(fileURL: URL(fileURLWithPath: "/dev/null"))
        let faultyRealmManager = try RealmManager(configuration: invalidConfiguration)
        
        let testObject = TestObject(id: "1", name: "Test")
        
        try faultyRealmManager.deleteObject(testObject)
        let fetchedObjects = try faultyRealmManager.fetchObjects(ofType: TestObject.self)
        XCTAssertEqual(fetchedObjects.count, 0)
    }
}
