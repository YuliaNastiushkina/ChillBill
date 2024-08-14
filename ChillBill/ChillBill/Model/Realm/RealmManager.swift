import Foundation
import RealmSwift

/// A singleton class responsible for managing interactions with the Realm database.
final class RealmManager {
    
    // MARK: - Internal interface
    
    /// The shared singleton instance of `RealmManager
    static let shared = RealmManager()
    
    // MARK: - Private interface
    private(set) var realm: Realm?
    
    /// This initializer is private to enforce the singleton pattern.
    /// If the Realm instance cannot be initialized, the application will terminate with a fatal error.
    private init() {
        do {
            self.realm = try Realm()
        } catch {
            print("Failed to initialize Realm: \(error.localizedDescription)")
            self.realm = nil
        }
    }
    
    /// Writes a block of code to the Realm database.
    /// - Parameter block: A closure containing the operations to be performed within the write transaction.
    private func write(_ block: () -> Void) {
        guard let realm = realm else {
            print("Realm is not initialized, cannot write to database.")
            return
        }
        do {
            try realm.write {
                block()
            }
        } catch {
            print("Failed to write to Realm: \(error)")
        }
    }
    
    // MARK: - Internal methods
    /// Checks whether `Realm` has been successfully initialized.
    /// - Returns: `true` if `Realm` has been successfully initialized or `false` if not.
    func isRealmInitialized() -> Bool {
        return realm != nil
    }
    
    /// Adds an object to the Realm database.
    /// - Parameter object: The object to be added to the database.
    func addObject(_ object: Object) {
        write {
            realm?.add(object)
        }
    }
}
