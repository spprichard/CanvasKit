import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    var hostSubDomain: String
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "\(hostSubDomain).instructure.com"
        components.path = "/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    func with(params: [URLQueryItem]) -> Endpoint {
        return Endpoint(path: self.path, queryItems: params, hostSubDomain: self.hostSubDomain)
    }
}
