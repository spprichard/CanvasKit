import Foundation

public struct Assignment: Codable {
    public var id: Int
    public var description: String
    public var name: String
    
    public init(id: Int, description: String, name: String) {
        self.id = id
        self.description = description
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "description"
        case name = "name"
    }
}


