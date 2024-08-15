import RealmSwift

class TestObject: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String = ""
    
    convenience init(id: String, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
}
