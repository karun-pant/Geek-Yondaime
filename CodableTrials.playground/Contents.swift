struct User: Codable {
    var name: String
    var email: String
    var id: String
    var metadata: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case name, email, id, metadata
    }
    
    
    func getParam() -> [String: Any] {
        var x : [String : Any] = [String : Any]()
        x["id"] = id
        x["email"] = email
        x["name"] = name
        x["metadata"] = metadata
        return x
    }
}

enum SearchParamType: Codable {
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = try .string(container.decode(String.self))
        } catch DecodingError.typeMismatch {
            throw DecodingError.typeMismatch(SearchParamType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload not of an expected type"))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let string):
            try container.encode(string.description)
        }
    }
}

import Foundation

let decoder = JSONDecoder()

let userJson = """
    {
    "id": "4yq6txdpfadhbaqnwp3",
    "email": "john.doe@example.com",
    "name":"John Doe",
    "metadata": {
      "link_id": "123"
    }
  }
""".data(using: .utf8)!

let user = try! decoder.decode(User.self, from: userJson)
print(user)
print("param: \(user.getParam())")

let encoder = PropertyListEncoder()
encoder.outputFormat = .xml
let plist = try! encoder.encode(user)
//print(String(data: plist, encoding: .utf8)!)
