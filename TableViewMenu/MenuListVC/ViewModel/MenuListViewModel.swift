

import UIKit

class MenuListViewModel: NSObject {
    
    typealias menuListResponse = (ResponseType,_ data: [MenuListModel]?) ->Void
    public var menuList =  [MenuListModel]()
    
    func getMenuList(onCompletion: @escaping menuListResponse) {
        let dealResource: RequestResources<[MenuListModel]> = RequestResources(path: "AllMenu")
        dealResource.asyncResourceLoading { (type, response) in
            if type == .kresponseTypeSuccess {
                DispatchQueue.main.async {
                    guard let model = response else {
                        return
                    }
                    self.menuList = model
                    onCompletion(ResponseType.kresponseTypeSuccess, model)
                }
            }
            else
            {
                DispatchQueue.main.async {
                    onCompletion(ResponseType.kResponseTypeFail, nil)
                }
            }
        }
    }
    
}
