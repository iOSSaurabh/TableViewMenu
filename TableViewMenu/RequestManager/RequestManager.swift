
import Foundation
public struct RequestResources<T: Decodable> {
    let path: String
}

public enum ResponseType: Int {
    case   kResponseTypeFail = 0
    case  kresponseTypeSuccess
}

extension RequestResources {
    public func asyncResourceLoading(completion: @escaping (ResponseType, T?) -> ()) {
        if let path = Bundle.main.path(forResource: path, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.kresponseTypeSuccess, result)
                } catch  {
                    print(error.localizedDescription)
                    completion(.kResponseTypeFail, nil)
                }
            } catch {
                // handle error
                completion(.kResponseTypeFail, nil)
            }
        }
        
        
    }
}
