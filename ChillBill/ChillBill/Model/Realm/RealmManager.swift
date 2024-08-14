import Foundation
import RealmSwift

/// A singleton class responsible for managing interactions with the Realm database.
final class RealmManager {
    
    // MARK: - Internal interface
    
    /// The shared singleton instance of `RealmManager
    static let shared: RealmManager = {
        let manager = RealmManager()
        return manager
    }()
    
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
    
    // MARK: - Internal methods
    /// Checks whether `Realm` has been successfully initialized.
    /// - Returns: `true` if `Realm` has been successfully initialized or `false` if not.
    func isRealmInitialized() -> Bool {
        return realm != nil
    }
}
