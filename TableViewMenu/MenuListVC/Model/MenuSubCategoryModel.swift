

import Foundation
struct MenuSubCategoryModel : Codable {
    let name : String?
    let display_name : String?
    

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case display_name = "display_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
    }

}
