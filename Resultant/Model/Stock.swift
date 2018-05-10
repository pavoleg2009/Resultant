import Foundation
struct Stock : Codable {
	let name : String?
	let price : Price?
	let percentChange : Double?
	let volume : Int?
	let symbol : String?

	enum CodingKeys: String, CodingKey {

		case name
		case price
		case percentChange = "percent_change"
		case volume
		case symbol
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		price = try values.decodeIfPresent(Price.self, forKey: .price)
		percentChange = try values.decodeIfPresent(Double.self, forKey: .percentChange)
		volume = try values.decodeIfPresent(Int.self, forKey: .volume)
		symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
	}

}
