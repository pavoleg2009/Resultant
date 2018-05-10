import Foundation

struct ResponseModel : Codable {
	let stock : [Stock]?
	let asOf : String?

	enum CodingKeys: String, CodingKey {

		case stock = "stock"
		case asOf = "as_of"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		stock = try values.decodeIfPresent([Stock].self, forKey: .stock)
		asOf = try values.decodeIfPresent(String.self, forKey: .asOf)
	}

}
