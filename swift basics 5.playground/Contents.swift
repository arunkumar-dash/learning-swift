import Foundation

//codeable

struct User: Codable {
    var firstName: String
    var lastName: String
    var country: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case country
    }
}


var jsonString = """
{
    "first_name": "John",
    "last_name":  "Doe",
    "country":    "United Kingdom"
}
"""

do{
    let jsonData = jsonString.data(using: .utf8)!
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    print(user.lastName, user.firstName)
} catch {
    print(error.localizedDescription)
}

var user = User(firstName: "Bob", lastName: "and Alice", country: "Cryptoland")

var jsonData : Data
do {
    jsonData = try JSONEncoder().encode(user)
    jsonString = String(data: jsonData, encoding: .utf8)!
    print(jsonString)

} catch {
    print(error.localizedDescription)
}

jsonString = """
{
    "users":
        [
            {
                "first_name": "Arthur",
                "last_name": "Dent",
                "country": "India"
            }, {
                "first_name": "Zaphod",
                "last_name": "Beeblebrox",
                "country": "United States"
            }, {
                "first_name": "Marvin",
                "last_name": "The Paranoid Android",
                "country": "Australia"
            }
        ]
}
"""

struct Response: Codable
{
    struct User: Codable {
        var firstName: String
        var lastName: String
        var country: String
        
        enum CodingKeys: String, CodingKey{
            case firstName = "first_name"
            case lastName = "last_name"
            case country
        }
    }

    var users: [User]
}

jsonData = jsonString.data(using: .utf8)!
let users = try! JSONDecoder().decode(Response.self, from: jsonData)

for user in users.users {
    print(user.firstName)
}
