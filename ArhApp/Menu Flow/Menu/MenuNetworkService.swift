import Foundation

final class MenuNetworkService {

    struct MenuResponse: Codable {
        let products: [Product]
        struct Product: Codable {
            let name: String
            let price: Int
            let currency: String
        }
    }

    func loadMenu(forCity city: String, completion: @escaping (MenuResponse) -> Void) {

        guard
            let url = Bundle.main.url(forResource: "Menu", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let response = try? JSONDecoder().decode(MenuResponse.self, from: data)
            else { return }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(response)
        }
    }
}
