import Foundation

public struct User: Codable {
    var id: Int
    var name: String
    var createdAt: String
    var sortableName: String?
    var shortName: String?
    var sisUserID: String?
    var integrationID: String?
    var loginID: String?
    var email: String
    
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
