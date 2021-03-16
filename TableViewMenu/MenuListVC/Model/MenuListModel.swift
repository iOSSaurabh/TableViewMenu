

import Foundation
struct MenuListModel : Codable {
    let name : String?
    let sub_category : [MenuSubCategoryModel]?
    var selectedIndex : Int? = 0

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case sub_category = "sub_category"
        case selectedIndex = "selectedIndex"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sub_category = try values.decodeIfPresent([MenuSubCategoryModel].self, forKey: .sub_category)
        selectedIndex = try (values.decodeIfPresent(Int.self, forKey: .selectedIndex) ?? 0)
    }

}
