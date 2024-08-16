import Foundation
import RealmSwift

/// A class responsible for managing interactions with the Realm database.
final class RealmManager {
    
    // MARK: - Internal interface
    
    /// Initializes a new instance of `RealmManager` with the specified Realm configuration.
    /// - Parameter configuration: The configuration to use when initializing the Realm instance. Defaults to `.defaultConfiguration`.
    /// - Throws: `RealmError.initializationFailed` if Realm initialization fails.
    init(configuration: Realm.Configuration = .defaultConfiguration) throws {
        do {
            self.realm = try Realm(configuration: configuration)
        } catch {
            throw RealmError.initializationFailed(reason: error.localizedDescription)
        }
    }
    
    /// Adds an object to the Realm database.
    /// - Parameter object: The object to be added to the database.
    /// - Throws: `RealmError.writeFailed` if the write operation fails.
    func addObject(_ object: Object) throws {
        try write {
            realm?.add(object)
        }
    }
    
    /// Retrieves all objects of the specified type from the Realm database.
    /// - Parameter type: The type of objects to fetch from the database.
    /// - Returns: An array of objects of the specified type, or an empty array if no objects are found or if Realm is not initialized.
    func fetchObjects<T: Object>(ofType type: T.Type) throws -> [T] {
        guard let result = realm?.objects(type) else {
            return []
        }
        return Array(result)
    }
    
    /// Deletes an object from the Realm database.
    /// - Parameter object: The object to be deleted from the database.
    /// - Throws: `RealmError.writeFailed` if the write operation fails.
    /// `RealmDeletionError.objectInvalidated` if the object is already invalidated or doesn't exist.
    func deleteObject(_ object: Object) throws {
        guard !object.isInvalidated else {
            throw RealmDeletionError.objectInvalidated
        }
        try write {
            realm?.delete(object)
        }
    }
    
    // MARK: - Private interface
    
    private(set) var realm: Realm?
    
    /// Writes a block of code to the Realm database.
    /// - Parameter block: A closure containing the operations to be performed within the write transaction.
    /// - Throws: `RealmError.writeFailed` if the write operation fails.
    private func write(_ block: () -> Void) throws {
        do {
            try realm?.write {
                block()
            }
        } catch {
            throw RealmError.writeFailed(reason: error.localizedDescription)
        }
    }
}
