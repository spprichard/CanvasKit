import Foundation

public struct User: Codable {
    public var id: Int
    public var name: String
    public var createdAt: String
    public var sortableName: String?
    public var shortName: String?
    public var sisUserID: String?
    public var integrationID: String?
    public var loginID: String?
    public var email: String
    
    public init(
        id: Int,
        name: String,
        createdAt: String,
        email: String
    ) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.email = email
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case createdAt = "created_at"
        case sortableName = "sortable_name"
        case shortName = "short_name"
        case sisUserID = "sis_user_id"
        case integrationID = "integration_id"
        case loginID = "login_id"
        case email
    }
}
