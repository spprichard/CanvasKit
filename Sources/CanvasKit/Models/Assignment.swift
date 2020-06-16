import Foundation

public struct Assignment: Codable {
    var id: Int
    var description: String
    var DueAt: String? // TODO: this should be a date
    var GradeType: String? // TODO: this should be a enum?
}


