import Foundation

struct Price : Codable {
	let currency : String?
	let amount : Double?

	enum CodingKeys: String, CodingKey {

		case currency = "currency"
		case amount = "amount"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		amount = try values.decodeIfPresent(Double.self, forKey: .amount)
	}

}
